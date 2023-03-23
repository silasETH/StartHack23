import 'package:flutter/material.dart';
import 'package:sperrgut_stgallen/ui/common/custom_appbar.dart';
import 'package:sperrgut_stgallen/ui/common/list_button.dart';
import 'package:sperrgut_stgallen/ui/common/ui_helpers.dart';
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
      appBar: CustomAppBar(
        home: viewModel.home,
        back: viewModel.back,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(mediumSize),
            child: Text(
              "Wie gross ist die Matratze?",
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
                  icon: Icons.hotel_outlined,
                  text: "Einzelmatraze (bis 130 cm)",
                ),
                ListButton(
                  onPressed: viewModel.selectBigItem,
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
  MattressSizeSelectViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MattressSizeSelectViewModel();
}
