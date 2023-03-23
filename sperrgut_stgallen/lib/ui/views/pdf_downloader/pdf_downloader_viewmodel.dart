import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:printing/printing.dart';
import 'package:sperrgut_stgallen/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:open_filex/open_filex.dart';

class PdfDownloaderViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void pop() {
    _navigationService.back();
  }

  void home() {
    _navigationService
        .popUntil((route) => route.settings.name == Routes.homeView);
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
          return pw.Column(
            children: [
              pw.Row(children: [
                pw.SizedBox(width: 19, height: 19, child: pw.Image(sgLogo)),
                pw.SizedBox(width: 9),
                pw.Text(
                  "Entsorgung Stadt St. Gallen",
                  style: pw.TextStyle(
                      fontSize: 19, fontWeight: pw.FontWeight.bold),
                )
              ]),
              pw.SizedBox(height: 10),
              pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.SizedBox(height: 16),
                          pw.Text("Sofa",
                              style: pw.TextStyle(
                                  fontSize: 18,
                                  fontWeight: pw.FontWeight.bold)),
                          pw.Text("mehr als 3 Sitzplätze",
                              style: const pw.TextStyle(fontSize: 17)),
                          pw.SizedBox(height: 10),
                          pw.Container(
                              width: 180,
                              height: 46,
                              padding: pw.EdgeInsets.all(10),
                              decoration: pw.BoxDecoration(
                                  border: pw.Border.all(
                                      width: 1, color: PdfColors.black)),
                              child: pw.Text(
                                  "1. Etikette zuschneiden \n2. Gut sichtbar befestigen",
                                  style: pw.TextStyle(color: PdfColors.black)))
                        ]),
                    pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.center,
                        children: [
                          pw.Text("2",
                              style: pw.TextStyle(
                                  fontSize: 72,
                                  fontWeight: pw.FontWeight.bold)),
                          pw.Text("Marken",
                              style: const pw.TextStyle(fontSize: 16))
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
                          pw.Text("31415926",
                              style: const pw.TextStyle(fontSize: 18))
                        ])
                  ]),
              pw.SizedBox(height: 10),
              pw.Divider(),
              pw.SizedBox(height: 10),
              pw.Row(children: [
                pw.SizedBox(width: 19, height: 19, child: pw.Image(sgLogo)),
                pw.SizedBox(width: 9),
                pw.Text(
                  "Entsorgung Stadt St. Gallen",
                  style: pw.TextStyle(
                      fontSize: 19, fontWeight: pw.FontWeight.bold),
                )
              ]),
              pw.SizedBox(height: 10),
              pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.SizedBox(height: 16),
                          pw.Text("Sofa",
                              style: pw.TextStyle(
                                  fontSize: 18,
                                  fontWeight: pw.FontWeight.bold)),
                          pw.Text("mehr als 3 Sitzplätze",
                              style: const pw.TextStyle(fontSize: 17)),
                          pw.SizedBox(height: 10),
                        ]),
                    pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.center,
                        children: [
                          pw.Text("2",
                              style: pw.TextStyle(
                                  fontSize: 72,
                                  fontWeight: pw.FontWeight.bold)),
                          pw.Text("Marken",
                              style: const pw.TextStyle(fontSize: 16))
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
                          pw.Text("31415926",
                              style: const pw.TextStyle(fontSize: 18))
                        ])
                  ]),
              pw.SizedBox(height: 10),
              pw.Divider(),
              pw.SizedBox(height: 10),
              
              makeItem(sgLogo, qrImage, "Sofa", "mehr als zwei Sitzplätze", 2)

            ],
          ); // Center
        })); // Page

    final output = await getTemporaryDirectory();
    final file = File("${output.path}/example.pdf");
    await file.writeAsBytes(await pdf.save());

    return file.path;
    // print(file.path);
    // await OpenFilex.open(file.path);
  }

  pw.Widget makeItem(pw.MemoryImage sgLogo, pw.MemoryImage qrImage, String str1, String str2, int nrOfStamps) {

    return pw.Column(children: [
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
            pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.SizedBox(height: 16),
                  pw.Text(str1,
                      style: pw.TextStyle(
                          fontSize: 18, fontWeight: pw.FontWeight.bold)),
                  pw.Text(str2,
                      style: const pw.TextStyle(fontSize: 17)),
                  pw.SizedBox(height: 10),
                ]),
            pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.center,
                children: [
                  pw.Text(nrOfStamps.toString(),
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
          ])
    ]);
  }
}
