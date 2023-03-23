import 'package:flutter/material.dart';
import 'package:open_filex/open_filex.dart';
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
