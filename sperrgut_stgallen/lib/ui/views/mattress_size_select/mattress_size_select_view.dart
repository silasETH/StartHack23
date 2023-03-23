import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'mattress_size_select_viewmodel.dart';

class MattressSizeSelectView extends StackedView<MattressSizeSelectViewModel> {
  const MattressSizeSelectView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    MattressSizeSelectViewModel viewModel,
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
  MattressSizeSelectViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MattressSizeSelectViewModel();
}
