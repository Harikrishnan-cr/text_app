import 'dart:developer';

import 'package:get/get.dart';
import 'package:intertoons/model/cart_model/cart_model.dart';

class CartController extends GetxController {
  final Map<String, CartModelScreen> _cartItems = {};

  Map<String, CartModelScreen> get getCartItems {
    return _cartItems;
  }

// num price = 0.0;
  var cartLength = 0;

  void addProductToCart(
      {required String productId,
      required int quantity,
      required num productPrice}) {
    _cartItems.putIfAbsent(
        productId,
        () => CartModelScreen(
            productPrice: productPrice * quantity,
            id: DateTime.now().toString(),
            productId: productId,
            productQuantity: quantity));

    update();
  }

  void increaseProductQuantityByOne(
      {required String productId, required num productPrice}) {
    _cartItems.update(
        productId,
        (value) => CartModelScreen(
            productPrice: productPrice * value.productQuantity,
            id: value.id,
            productId: productId,
            productQuantity: value.productQuantity + 1));

    update();
  }

  void reduceProductQuantityByOne(
      {required String productId, required num productPrice}) {
    _cartItems.update(
        productId,
        (value) => CartModelScreen(
            productPrice: productPrice * value.productQuantity,
            id: value.id,
            productId: productId,
            productQuantity: value.productQuantity - 1));

    update();
  }


  

  void cartLengthData() {
    cartLength = _cartItems.length;
    update();
  }
}
