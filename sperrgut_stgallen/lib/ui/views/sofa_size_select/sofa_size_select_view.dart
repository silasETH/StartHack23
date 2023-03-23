import 'package:flutter/material.dart';
import 'package:sperrgut_stgallen/ui/common/custom_appbar.dart';
import 'package:sperrgut_stgallen/ui/common/list_button.dart';
import 'package:sperrgut_stgallen/ui/common/ui_helpers.dart';
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
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(mediumSize),
            child: Text(
              "Wie viele Sitzplätze hat das Sofa?",
              style: TextStyle(
                fontSize: getResponsiveMassiveFontSize(context),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(mediumSize),
            child: Column(
              children: [
                ListButton(
                  onPressed: viewModel.selectSmallItem,
                  icon: Icons.weekend_outlined,
                  text: "Bis zu zwei Sitzplätze",
                ),
                ListButton(
                  onPressed: viewModel.selectBigItem,
                  icon: Icons.weekend_outlined,
                  text: "Drei oder mehr Sitzplätze",
                  leading: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(2),
                      child: Text("3+", style: TextStyle(fontSize: 20)),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  SofaSizeSelectViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SofaSizeSelectViewModel();
}
