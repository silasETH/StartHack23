import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:sperrgut_stgallen/services/user_data_service.dart';
import 'package:sperrgut_stgallen/ui/views/cart/cart_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';

class PdfDownloaderViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _userDataService = locator<UserDataService>();

  void pop() {
    _navigationService.back();
  }

  void home() {
    _navigationService
        .popUntil((route) => route.settings.name == Routes.homeView);
  }

  List<CartItemText> get cartItemTexts {
    List<CartItemText> cartItemTexts = [];

    for (var cartItem in _userDataService.cart) {
      CartItemText cartItemText = CartItemText();

      cartItemText.stamps = cartItem.stampCount.toString();

      switch (cartItem.type) {
        case CartItemType.sofa:
          {
            cartItemText.title = "Sofa";
            cartItemText.first = cartItem.bigItem
                ? "3 oder mehr Sitzplätze"
                : "bis zu 2 Sitzplätze";
            break;
          }

        case CartItemType.mattress:
          {
            cartItemText.title = "Matratze";
            cartItemText.first = cartItem.bigItem ? "Doppelt" : "Einzel";
            break;
          }

        case CartItemType.trashBag:
          {
            cartItemText.title = "Inoffizieller Abfallsack";
            break;
          }

        default:
          {
            cartItemText.title = "Sperrmüll";
            cartItemText.first =
                cartItem.bigItem ? "Übergrösse" : "Normalgrösse";
            switch (cartItem.weightClass) {
              case 0:
                {
                  cartItemText.second = "Weniger als 30kg";
                  break;
                }
              case 1:
                {
                  cartItemText.second = "Zwischen 30kg und 60kg";
                  break;
                }
              default:
                {
                  cartItemText.second = "Mehr als 60kg";
                  break;
                }
            }
            break;
          }
      }

      cartItemTexts.add(cartItemText);
    }

    return cartItemTexts;
  }

  Future<String> makePdf() async {
    final pdf = pw.Document();
    final sgLogo = pw.MemoryImage(
        (await rootBundle.load('lib/assets/logo_sg.png')).buffer.asUint8List());
    final qrImage = pw.MemoryImage(
        (await rootBundle.load('lib/assets/qrcode.png')).buffer.asUint8List());
    // final netImage = await networkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/6/61/QR_deWP.svg/1200px-QR_deWP.svg.png');

    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          List<pw.Widget> widgets = [];

          for (var cartItemText in cartItemTexts) {
            widgets.add(makeItem(
                sgLogo,
                qrImage,
                cartItemText.title!,
                cartItemText.first ?? "",
                cartItemText.second ?? "",
                cartItemText.stamps!));
          }

          return pw.Column(
            children: widgets,
          ); // Center
        })); // Page

    final output = await getTemporaryDirectory();
    final file = File("${output.path}/example.pdf");
    await file.writeAsBytes(await pdf.save());

    return file.path;
    // print(file.path);
    // await OpenFilex.open(file.path);
  }

  pw.Widget makeItem(pw.MemoryImage sgLogo, pw.MemoryImage qrImage, String str1,
      String str2, String str3, String nrOfStamps) {
    return pw.Column(
      children: [
        pw.SizedBox(height: 10),
        pw.Row(children: [
          pw.SizedBox(width: 19, height: 19, child: pw.Image(sgLogo)),
          pw.SizedBox(width: 9),
          pw.Text(
            "Entsorgung Stadt St. Gallen",
            style: pw.TextStyle(fontSize: 19, fontWeight: pw.FontWeight.bold),
          )
        ]),
        pw.SizedBox(height: 10),
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.SizedBox(
              width: 220,
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.SizedBox(height: 16),
                  pw.Text(str1,
                      style: pw.TextStyle(
                          fontSize: 18, fontWeight: pw.FontWeight.bold)),
                  pw.Text(str2, style: const pw.TextStyle(fontSize: 17)),
                  pw.Text(str3, style: const pw.TextStyle(fontSize: 17)),
                ],
              ),
            ),
            pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.center,
                children: [
                  pw.Text(nrOfStamps,
                      style: pw.TextStyle(
                          fontSize: 72, fontWeight: pw.FontWeight.bold)),
                  pw.Text("Marken", style: const pw.TextStyle(fontSize: 16))
                ]),
            pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.center,
                children: [
                  pw.SizedBox(
                    width: 110,
                    height: 110,
                    child: pw.Image(qrImage),
                  ),
                  pw.SizedBox(height: 7),
                  pw.Text("31415926", style: const pw.TextStyle(fontSize: 18))
                ])
          ],
        ),
        pw.SizedBox(height: 10),
        pw.Divider(),
      ],
    );
  }
}
