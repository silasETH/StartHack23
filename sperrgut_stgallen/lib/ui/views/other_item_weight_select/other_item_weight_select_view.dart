import 'package:flutter/material.dart';
import 'package:sperrgut_stgallen/ui/common/custom_appbar.dart';
import 'package:sperrgut_stgallen/ui/common/list_button.dart';
import 'package:sperrgut_stgallen/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';

import 'other_item_weight_select_viewmodel.dart';

class OtherItemWeightSelectView
    extends StackedView<OtherItemWeightSelectViewModel> {
  const OtherItemWeightSelectView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    OtherItemWeightSelectViewModel viewModel,
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
              "Wie schwer ist das Objekt?",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(mediumSize),
            child: Column(
              children: [
                ListButton(
                  onPressed: viewModel.selectSmaller30Item,
                  icon: Icons.scale_outlined,
                  text: "Weniger als 30kg",
                ),
                ListButton(
                  onPressed: viewModel.select30To60Item,
                  icon: Icons.monitor_weight_outlined,
                  text: "Zwischen 30 und 60kg",
                ),
                ListButton(
                  onPressed: viewModel.selectLarger60Item,
                  icon: Icons.fitness_center_outlined,
                  text: "Mehr als 60kg",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  OtherItemWeightSelectViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      OtherItemWeightSelectViewModel();
}
