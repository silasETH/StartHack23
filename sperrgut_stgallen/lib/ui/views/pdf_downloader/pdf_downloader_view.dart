import 'package:flutter/material.dart';
import 'package:open_filex/open_filex.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_colors.dart';
import '../../common/custom_appbar.dart';
import '../../common/ui_helpers.dart';
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
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(mediumSize),
              child: Text(
                "PDF Download",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Center(
              child: MaterialButton(
                padding: const EdgeInsets.all(20),
                color: Colors.white,
                onPressed: () async => openFile(await viewModel.makePdf()),
                child: SizedBox(
                  height: 120,
                  width: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      verticalSpaceSmall,
                      Icon(
                        Icons.picture_as_pdf_outlined,
                        color: kcDarkGreyColor,
                        size: 50,
                      ),
                      verticalSpaceSmall,
                      Text(
                        'PDF herunterladen',
                        style: TextStyle(color: kcDarkGreyColor, fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
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
