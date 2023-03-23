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
            child: CartItems(cartItemTexts: viewModel.cartItemTexts),
          ),
          Padding(
            padding: const EdgeInsets.all(mediumSize),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total",
                  style: TextStyle(
                    fontSize: getResponsiveLargeFontSize(context),
                  ),
                ),
                Text(
                  viewModel.total,
                  style: TextStyle(
                    fontSize: getResponsiveLargeFontSize(context),
                  ),
                ),
              ],
            ),
          ),
          Divider(),
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
                Expanded(
                  child: Material(
                    color: kcPrimaryColor,
                    borderRadius: BorderRadius.circular(smallSize),
                    child: InkWell(
                      onTap: viewModel.pay,
                      child: Container(
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

class CartItems extends StatelessWidget {
  final List<CartItemText> cartItemTexts;

  CartItems({required this.cartItemTexts});

  @override
  Widget build(BuildContext context) {
    List<Widget> cartItemWidgets = [];

    for (var cartItemText in cartItemTexts) {
      cartItemWidgets.add(
        Row(
          children: [
            if (cartItemText.first != null) Text(cartItemText.first!),
            const Expanded(child: SizedBox()),
            Text(cartItemText.stamps ?? "0"),
          ],
        ),
      );
    }

    return ListView(
      children: cartItemWidgets,
    );
  }
}
