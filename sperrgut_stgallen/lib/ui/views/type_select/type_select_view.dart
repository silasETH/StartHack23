import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'type_select_viewmodel.dart';

class TypeSelectView extends StackedView<TypeSelectViewModel> {
  const TypeSelectView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    TypeSelectViewModel viewModel,
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
  TypeSelectViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TypeSelectViewModel();
}
