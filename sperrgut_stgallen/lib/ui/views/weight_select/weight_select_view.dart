import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'weight_select_viewmodel.dart';

class WeightSelectView extends StackedView<WeightSelectViewModel> {
  const WeightSelectView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    WeightSelectViewModel viewModel,
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
  WeightSelectViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      WeightSelectViewModel();
}
