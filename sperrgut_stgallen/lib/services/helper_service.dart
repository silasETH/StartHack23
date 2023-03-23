import 'package:sperrgut_stgallen/app/app.locator.dart';
import 'package:sperrgut_stgallen/services/user_data_service.dart';

class HelperService {
  final UserDataService _userDataService = locator<UserDataService>();

  List<CartItemText> get cartItemTexts {
    List<CartItemText> cartItemTexts = [];

    for (var cartItem in _userDataService.cart) {
      CartItemText cartItemText = CartItemText();

      cartItemText.stamps = cartItem.stampCount.toString();
      cartItemText.code = cartItem.codeAsString();

      switch (cartItem.type) {
        case CartItemType.sofa:
          {
            cartItemText.title = "Sofa";
            cartItemText.first = cartItem.bigItem
                ? "3 oder mehr Sitzplätze"
                : "bis zu 2 Sitzplätze";
            break;
          }

        case CartItemType.mattress:
          {
            cartItemText.title = "Matratze";
            cartItemText.first = cartItem.bigItem ? "Doppelt" : "Einzel";
            break;
          }

        case CartItemType.trashBag:
          {
            cartItemText.title = "Inoffizieller Abfallsack";
            break;
          }

        default:
          {
            cartItemText.title = "Sperrmüll";
            cartItemText.first =
                cartItem.bigItem ? "Übergrösse" : "Normalgrösse";
            switch (cartItem.weightClass) {
              case 0:
                {
                  cartItemText.second = "Weniger als 30kg";
                  break;
                }
              case 1:
                {
                  cartItemText.second = "Zwischen 30kg und 60kg";
                  break;
                }
              default:
                {
                  cartItemText.second = "Mehr als 60kg";
                  break;
                }
            }
            break;
          }
      }

      cartItemTexts.add(cartItemText);
    }

    return cartItemTexts;
  }
}

class CartItemText {
  String? title;
  String? first;
  String? second;
  String? stamps;
  String? code;
}
