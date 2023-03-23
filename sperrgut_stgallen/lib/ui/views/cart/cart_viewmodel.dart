import 'package:sperrgut_stgallen/app/app.locator.dart';
import 'package:sperrgut_stgallen/app/app.router.dart';
import 'package:sperrgut_stgallen/services/user_data_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CartViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _userDataService = locator<UserDataService>();

  List<CartItemText> get cartItemTexts {
    List<CartItemText> cartItemTexts = [];

    for (var cartItem in _userDataService.cart) {
      CartItemText cartItemText = CartItemText();

      cartItemText.stamps = cartItem.stampCount.toString();

      switch (cartItem.type) {
        case CartItemType.sofa:
          {
            cartItemText.title = "Sofa";
            cartItemText.first = cartItem.bigItem
                ? "mehr als 3 Sitzplätze"
                : "bis zu 2 Sitzplätze";
            break;
          }

        case CartItemType.matres:
          {
            cartItemText.title = "Matratze";
            cartItemText.first = cartItem.bigItem ? "Doppelt" : "Einzel";
            break;
          }

        case CartItemType.trashBin:
          {
            cartItemText.title = "Nicht-Offizieller Abfallsack";
            break;
          }

        default:
          {
            cartItemText.title = "Sperrmüll";
            cartItemText.first =
                "weniger als ${(cartItem.weightClass + 1) * 30}kg";
            cartItemText.second =
                cartItem.bigItem ? "Übergrösse" : "Normalgrösse";
            break;
          }
      }

      cartItemTexts.add(cartItemText);
    }

    return cartItemTexts;
  }

  String get total =>
      "CHF 8.60 × ${_userDataService.calcTotalStampCount()} = CHF ${(_userDataService.calcTotalStampCount() * 8.6).toStringAsFixed(2)}";

  void pay() {
    print("Pay");
  }

  void salePoints() {
    print("SalePoints");
  }

  void back() {}

  void home() {
    _navigationService
        .popUntil((route) => route.settings.name == Routes.homeView);
  }
}

class CartItemText {
  String? title;
  String? first;
  String? second;
  String? stamps;
}
