import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'other_item_size_select_viewmodel.dart';

class OtherItemSizeSelectView
    extends StackedView<OtherItemSizeSelectViewModel> {
  const OtherItemSizeSelectView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    OtherItemSizeSelectViewModel viewModel,
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
  OtherItemSizeSelectViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      OtherItemSizeSelectViewModel();
}
