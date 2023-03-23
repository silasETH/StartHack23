import 'dart:io';
import 'dart:async';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';

class UserDataService {
  CartItem currentCartItem = CartItem();
  List<CartItem> cart = [];

  Future<File> get localFile async {
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/userData.data';
    return File(path);
  }

  void saveToDisk() async
  {
    final file = await localFile;
    IOSink io = file.openWrite();
    String id = "TRSH";
    int version = 0;
    io.add(id.codeUnits);
    io.add([version]);
    io.add([cart.length]);
    for(var item in cart){
      item.save(io);
    }
    await io.flush();
    await io.close();
  }

  void loadFromDisk() async
  {
    try{
      final file = await localFile;
      var io = IOSource(file);
      String id = String.fromCharCodes([io.next(), io.next(), io.next(), io.next()]);
      if(id != "TRSH"){
        print("file id doesn't match");
        return;
      }
      int version = io.next();
      int length = io.next();
      for(var i = 0; i < length; i++){
        cart.add(await CartItem.load(io, version));
      }
      assert(cart.length == length);
    }catch(_){}
  }

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
    if(currentCartItem.type != CartItemType.other) {
      currentCartItem.weightClass = 0;
    }
    if(currentCartItem.type == CartItemType.trashBag) {
      currentCartItem.bigItem = false;
    }
    cart.add(currentCartItem);
    currentCartItem = CartItem();
    saveToDisk();
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

enum CartItemType
{
  undefined,
  sofa,
  mattress,
  other,
  trashBag,
}

class CartItem {
  CartItemType type = CartItemType.undefined;
  bool bigItem = false;
  int weightClass = 0;

  int get stampCount => weightClass + (bigItem ? 2 : 1);

  static Future<CartItem> load(IOSource io, int version) async
  {
    CartItem result = CartItem();
    result.type = CartItemType.values[io.next()];
    result.bigItem = io.next() == 0 ? false : true;
    result.weightClass = io.next();
    return result;
  }

  void save(IOSink io) {
    io.add([type.index, bigItem ? 1 : 0, weightClass]);
  }
}
class IOSource
{
  late Uint8List data;
  int index = 0;

  IOSource(File file)
  {
    data = file.readAsBytesSync();
  }

  int next()
  {
    return data[index++];
  }
}
