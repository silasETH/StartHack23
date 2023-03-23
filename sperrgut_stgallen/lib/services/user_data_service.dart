class UserDataService {
  CartItem currentCartItem = CartItem();
  List<CartItem> cart = [];

  bool isCartEmpty() {
    return cart.isEmpty;
  }

  void createNewCart() {
    currentCartItem = CartItem();
    cart = [];
  }

  bool tryAddingItemToCart() {
    if (currentCartItem.type == CartItemType.undefined) {
      return false;
    }
    cart.add(currentCartItem);
    currentCartItem = CartItem();
    return true;
  }

  void setItemType(CartItemType type) {
    assert(type != CartItemType.undefined);
    currentCartItem.type = type;
  }

  void setItemSize(bool bigSize) {
    currentCartItem.bigItem = bigSize;
  }

  void setItemWeight(int weightClass) {
    currentCartItem.weightClass = weightClass;
  }

  int calcTotalStampCount() {
    int result = 0;
    for (var item in cart) {
      result += item.stampCount;
    }
    return result;
  }

  bool tryDeleteCartItem(int index) {
    if (index < 0 || index >= cart.length) {
      return false;
    }
    cart.removeAt(index);
    return true;
  }
}

enum CartItemType { undefined, sofa, matres, other }

class CartItem {
  CartItemType type = CartItemType.undefined;
  bool bigItem = false;
  int weightClass = 0;

  int get stampCount => weightClass + (bigItem ? 2 : 1);
}
