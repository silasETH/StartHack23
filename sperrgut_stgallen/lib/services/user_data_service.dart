import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';

class UserDataService {
  CartItem currentCartItem = CartItem();
  List<CartItem> cart = [];
  List<Receipt> receipts = [];

  void resetData() {
    currentCartItem = CartItem();
    cart = [];
    receipts = [];
  }

  Future<File> get localFile async {
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/userData.data';
    return File(path);
  }

  void saveToDisk() async {
    final file = await localFile;
    IOSink io = file.openWrite();
    String id = "TRSH";
    int version = 2;
    io.add(id.codeUnits);
    io.add([version]);
    io.add([cart.length]);
    for (var item in cart) {
      item.save(io);
    }
    await io.flush();
    await io.close();
  }

  void loadFromDisk() async {
    resetData();
    try {
      final file = await localFile;
      var io = IOSource(file);
      String id = String.fromCharCodes(io.nextUint8List(4));
      if (id != "TRSH") {
        // print("file id doesn't match");
        return;
      }
      int version = io.nextUint8();
      int length = io.nextUint8();
      for (var i = 0; i < length; i++) {
        cart.add(await CartItem.load(io, version));
      }
      if (version >= 1) {
        int length = io.nextUint8();
        for (var i = 0; i < length; i++) {
          receipts.add(await Receipt.load(io, version));
        }
      }
      assert(cart.length == length);
    } catch (_) {}
  }

  bool isCartEmpty() {
    return cart.isEmpty;
  }

  void createNewCart() {
    currentCartItem = CartItem();
    cart = [];
    saveToDisk();
  }

  bool tryAddingItemToCart() {
    if (currentCartItem.type == CartItemType.undefined) {
      return false;
    }
    if (currentCartItem.type != CartItemType.other) {
      currentCartItem.weightClass = 0;
    }
    if (currentCartItem.type == CartItemType.trashBag) {
      currentCartItem.bigItem = false;
    }
    currentCartItem.code = CartItem.itemToRandomCode(currentCartItem);
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

  void buyCart(bool paid) {
    receipts.add(Receipt.create(cart, paid));
    createNewCart();
    saveToDisk();
  }

  Receipt getLatestPurchase() {
    return receipts.last;
  }
}

enum CartItemType {
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
  List<int> code = [];

  int get stampCount => weightClass + (bigItem ? 2 : 1);

  static Future<CartItem> load(IOSource io, int version) async {
    CartItem result = CartItem();
    result.type = CartItemType.values[io.nextUint8()];
    result.bigItem = io.nextUint8() == 0 ? false : true;
    result.weightClass = io.nextUint8();
    if (version >= 2) {
      result.code = io.nextUint8List(6);
    }
    return result;
  }

  void save(IOSink io) {
    io.add([type.index, bigItem ? 1 : 0, weightClass]);
    io.add(code);
  }

  static final List<int> forbiddenToSanitized = [0, 2, 5, 6, 7, 8];
  static final List<int> sanitizedToForbidden = [0, 0, 1, 0, 0, 2, 3, 4, 5, 0];
  static final List<int> numberPair = [3, 2, 1, 0, 5, 4];
  static final List<bool> forbidden = [
    false,
    true,
    false,
    true,
    true,
    false,
    false,
    false,
    false,
    true
  ];

  static List<int> itemToCode(CartItem item) {
    List<int> result = [
      item.type.index,
      item.bigItem ? 1 : 0,
      item.weightClass
    ];
    result = result
        .expand((e) => [e, numberPair[e]])
        .map((e) => forbiddenToSanitized[e])
        .toList();
    return result;
  }

  static List<int> itemToRandomCode(CartItem item) {
    final random = Random();
    List<int> result = [
      item.type.index,
      item.bigItem ? 1 : 0,
      item.weightClass
    ];
    result[1] += random.nextInt(3) * 2;
    result[2] += random.nextInt(2) * 3;
    result = result
        .expand((e) => [e, numberPair[e]])
        .map((e) => forbiddenToSanitized[e])
        .toList();
    return result;
  }

  static bool isCodeValid(List<int> code) {
    if (code.length != 6) {
      return false;
    }
    if (code.any((e) => forbidden[e])) {
      return false;
    }
    code = code.map((e) => sanitizedToForbidden[e]).toList();
    for (int i = 0; i < 6; i += 2) {
      if (code[i] != numberPair[code[i + 1]]) {
        return false;
      }
    }
    return true;
  }

  static CartItem codeToItem(List<int> code) {
    assert(isCodeValid(code));
    code = code.map((e) => sanitizedToForbidden[e]).toList();
    CartItem result = CartItem();
    result.type = CartItemType.values[code[0] % 5];
    result.bigItem = (code[2] % 2) == 0 ? false : true;
    result.weightClass = code[4] % 3;
    return result;
  }

  String codeAsString() {
    return "${code[0]}${code[1]}${code[2]} ${code[3]}${code[4]}${code[5]}";
  }
}

class Receipt {
  List<CartItem> items = [];
  bool paid = false;

  static create(List<CartItem> items, bool paid) {
    Receipt result = Receipt();
    result.items = items;
    result.paid = paid;
  }

  void save(IOSink io) {
    io.add([items.length]);
    for (var item in items) {
      item.save(io);
    }
    io.add([paid ? 1 : 0]);
  }

  static Future<Receipt> load(IOSource io, version) async {
    Receipt result = Receipt();
    int length = io.nextUint8();
    for (var i = 0; i < length; i++) {
      result.items.add(await CartItem.load(io, version));
    }
    if (version == 1) {
      io.nextUint8List(9);
    }
    result.paid = io.nextUint8() != 0;
    return result;
  }
}

class IOSource {
  late Uint8List data;
  int index = 0;

  IOSource(File file) {
    data = file.readAsBytesSync();
  }

  int nextUint8() {
    return data[index++];
  }

  List<int> nextUint8List(int count) {
    List<int> result = [];
    for (var i = 0; i < count; i++) {
      result.add(nextUint8());
    }
    return result;
  }
}
