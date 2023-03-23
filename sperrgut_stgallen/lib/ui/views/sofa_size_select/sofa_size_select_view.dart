import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'sofa_size_select_viewmodel.dart';

class SofaSizeSelectView extends StackedView<SofaSizeSelectViewModel> {
  const SofaSizeSelectView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SofaSizeSelectViewModel viewModel,
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
  SofaSizeSelectViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SofaSizeSelectViewModel();
}
