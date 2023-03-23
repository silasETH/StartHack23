import 'package:flutter/material.dart';
import 'package:sperrgut_stgallen/ui/common/custom_appbar.dart';
import 'package:sperrgut_stgallen/ui/common/list_button.dart';
import 'package:sperrgut_stgallen/ui/common/ui_helpers.dart';
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
      appBar: CustomAppBar(
        back: viewModel.back,
        home: viewModel.home,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(mediumSize),
            child: Text(
              "Um welchen Typ von Sperrgut handelt es sich?",
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
                  onPressed: viewModel.selectSofa,
                  icon: Icons.weekend_outlined,
                  text: "Sofa",
                ),
                ListButton(
                  onPressed: viewModel.selectMattress,
                  icon: Icons.hotel_outlined,
                  text: "Matratze",
                ),
                ListButton(
                  onPressed: viewModel.selectTrashBag,
                  icon: Icons.delete_outlined,
                  text: "Nicht-Offizielle Abfallsäcke",
                ),
                ListButton(
                  onPressed: viewModel.selectOther,
                  icon: Icons.more_horiz_outlined,
                  text: "Sonstiges Sperrgut",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  TypeSelectViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TypeSelectViewModel();
}
