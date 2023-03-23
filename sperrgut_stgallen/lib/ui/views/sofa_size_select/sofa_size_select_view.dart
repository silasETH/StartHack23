import 'package:flutter/material.dart';
import 'package:sperrgut_stgallen/ui/common/custom_appbar.dart';
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
      appBar: CustomAppBar(
        home: viewModel.home,
        back: viewModel.back,
      ),
    );
  }

  @override
  SofaSizeSelectViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SofaSizeSelectViewModel();
}
