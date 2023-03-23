import 'package:flutter/material.dart';
import 'package:open_filex/open_filex.dart';
import 'package:sperrgut_stgallen/services/helper_service.dart';
import 'package:sperrgut_stgallen/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_colors.dart';
import '../../common/custom_appbar.dart';
import 'pdf_downloader_viewmodel.dart';

class PdfDownloaderView extends StackedView<PdfDownloaderViewModel> {
  const PdfDownloaderView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PdfDownloaderViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: CustomAppBar(
        back: viewModel.pop,
        home: viewModel.home,
      ),
      floatingActionButton: SizedBox(
        width: 80,
        height: 80,
        child: FloatingActionButton(
          onPressed: () async => openFile(await viewModel.makePdf()),
          child: const Icon(
            Icons.qr_code,
            size: 40,
          ),
          backgroundColor: kcPrimaryColor,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
                mediumSize, mediumSize, mediumSize, 0),
            child: Row(
              children: const [
                SizedBox(
                  width: 160,
                  child: Text(
                    "Bezeichnung",
                    style: TextStyle(
                      fontSize: 18,
                      color: kcPrimaryColor,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Text(
                  "Code",
                  style: TextStyle(
                    fontSize: 18,
                    color: kcPrimaryColor,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Expanded(child: SizedBox()),
                Text(
                  "Marken",
                  style: TextStyle(
                    fontSize: 18,
                    color: kcPrimaryColor,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.end,
                ),
              ],
            ),
          ),
          Expanded(child: ReceiptItems(cartItemTexts: viewModel.cartItemTexts)),
        ],
      ),
    );
  }

  @override
  PdfDownloaderViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PdfDownloaderViewModel();

  Future openFile(String filepath) async {
    await OpenFilex.open(filepath);
  }
}

class ReceiptItems extends StatelessWidget {
  final List<CartItemText> cartItemTexts;

  const ReceiptItems({super.key, required this.cartItemTexts});

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];

    for (var cartItemText in cartItemTexts) {
      widgets.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: smallSize),
            Row(
              children: [
                SizedBox(
                  width: 160,
                  child: Text(
                    cartItemText.title ?? "Sperrgut",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                Text(
                  cartItemText.code ?? "",
                  style:
                      const TextStyle(fontFamily: "RobotoMono", fontSize: 18),
                ),
                const Expanded(child: SizedBox()),
                Text(
                  cartItemText.stamps ?? "0",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            const SizedBox(height: smallSize),
            const Divider(),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(mediumSize),
      child: ListView(
        children: widgets,
      ),
    );
  }
}
