import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

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
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  PdfDownloaderViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PdfDownloaderViewModel();
}
