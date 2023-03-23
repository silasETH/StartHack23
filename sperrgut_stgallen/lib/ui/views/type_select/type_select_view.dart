import 'package:flutter/material.dart';
import 'package:sperrgut_stgallen/ui/common/app_colors.dart';
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
              style: Theme.of(context).textTheme.displayLarge,
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
                  text: "Inoffizieller Abfallsack",
                ),
                ListButton(
                  onPressed: viewModel.selectOther,
                  icon: Icons.more_horiz_outlined,
                  text: "Sonstiges Sperrgut",
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(mediumSize),
            child: Card(
              elevation: 0,
              shape: const RoundedRectangleBorder(
                  side: BorderSide(
                    color: kcDarkGreyColor,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Padding(
                padding: paddingMedium,
                child: Row(
                  children: [
                    const Icon(
                      Icons.warning_rounded,
                      color: kcPrimaryColor,
                      size: 30,
                    ),
                    horizontalSpaceMedium,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Weitergeben statt Verbrennen",
                            style: TextStyle(
                                fontWeight: FontWeight.w300, fontSize: 18),
                          ),
                          verticalSpaceSmall,
                          Text(
                            "Abgeholtes Sperrgut wird restlos verbrannt. Überprüfen Sie, ob die Ware nicht weitergegeben werden kann, um Ressourcen zu sparen.",
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
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
