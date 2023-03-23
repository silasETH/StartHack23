import 'package:flutter/material.dart';
import 'package:sperrgut_stgallen/ui/common/custom_appbar.dart';
import 'package:sperrgut_stgallen/ui/common/list_button.dart';
import 'package:sperrgut_stgallen/ui/common/ui_helpers.dart';
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
      appBar: CustomAppBar(
        home: viewModel.home,
        back: viewModel.back,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(mediumSize),
            child: Text(
              "Wie gross ist das Objekt?",
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
                  onPressed: () {},
                  icon: Icons.hotel_outlined,
                  text: "Einzelmatraze (bis 130 cm)",
                ),
                ListButton(
                  onPressed: () {},
                  icon: Icons.king_bed_outlined,
                  text: "Doppelmatraze (ab 130 cm)",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  OtherItemSizeSelectViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      OtherItemSizeSelectViewModel();
}
