import 'package:flutter/material.dart';
import 'package:sperrgut_stgallen/services/helper_service.dart';
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
          Padding(
            padding: const EdgeInsets.fromLTRB(
                mediumSize, mediumSize, mediumSize, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Bezeichnung",
                  style: TextStyle(
                    fontSize: 18,
                    color: kcPrimaryColor,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text(
                  "Marken",
                  style: TextStyle(
                    fontSize: 18,
                    color: kcPrimaryColor,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.end,
                ),
              ],
            ),
          ),
          Expanded(
            child: CartItems(
              cartItemTexts: viewModel.cartItemTexts,
              onAdd: viewModel.registerItem,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(mediumSize),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  viewModel.total,
                  style: Theme.of(context).textTheme.bodyLarge,
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
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    padding: const EdgeInsets.all(smallSize),
                    child: const Text(
                      "Verkaufsstellen",
                      style: TextStyle(
                        fontSize: 18,
                        shadows: [
                          Shadow(color: kcDarkGreyColor, offset: Offset(0, -5))
                        ],
                        color: Colors.transparent,
                        decoration: TextDecoration.underline,
                        decorationColor: kcDarkGreyColor,
                        decorationThickness: 2,
                        decorationStyle: TextDecorationStyle.solid,
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
                        child: const Center(
                          child: Text(
                            "Bezahlen",
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
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
  final Function() onAdd;

  CartItems({required this.cartItemTexts, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];

    for (var cartItemText in cartItemTexts) {
      widgets.add(
        Column(
          children: [
            const SizedBox(height: smallSize),
            Row(
              children: [
                SizedBox(
                  width: 120,
                  child: Text(
                    cartItemText.title ?? "Sperrgut",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                (cartItemText.second != null)
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(cartItemText.first!,
                              style: Theme.of(context).textTheme.bodyMedium),
                          Text(cartItemText.second!,
                              style: Theme.of(context).textTheme.bodyMedium),
                        ],
                      )
                    : (cartItemText.first != null)
                        ? Text(cartItemText.first!,
                            style: Theme.of(context).textTheme.bodyMedium)
                        : const SizedBox(),
                const Expanded(child: SizedBox()),
                Text(
                  cartItemText.stamps ?? "0",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            const SizedBox(height: smallSize),
            Divider(),
          ],
        ),
      );
    }

    widgets.add(
      MaterialButton(
        onPressed: onAdd,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.add,
              size: mediumSize,
            ),
            const SizedBox(width: smallSize),
            Text(
              "Weiteres Sperrgut erfassen",
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
      ),
    );

    return Padding(
      padding: const EdgeInsets.all(mediumSize),
      child: ListView(
        children: widgets,
      ),
    );
  }
}
