import 'package:flutter/material.dart';
import 'package:sperrgut_stgallen/ui/common/app_colors.dart';
import 'package:sperrgut_stgallen/ui/common/custom_appbar.dart';
import 'package:sperrgut_stgallen/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';

import 'cart_viewmodel.dart';

class CartView extends StackedView<CartViewModel> {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CartViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: CustomAppBar(
        back: () {},
        home: viewModel.home,
        showBack: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.lightBlue,
            ),
          ),
          Text("Total"),
          Padding(
            padding: const EdgeInsets.all(smallSize),
            child: Row(
              children: [
                MaterialButton(
                  onPressed: viewModel.salePoints,
                  child: Container(
                    padding: const EdgeInsets.all(smallSize),
                    child: Text(
                      "Verkaufsstellen",
                      style: TextStyle(
                        fontSize: getResponsiveLargeFontSize(context),
                      ),
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: viewModel.pay,
                  child: Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: kcPrimaryColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: const EdgeInsets.all(smallSize),
                      child: Center(
                        child: Text(
                          "Bezahlen",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: getResponsiveLargeFontSize(context),
                          ),
                        ),
                      ),
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
  CartViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CartViewModel();
}
