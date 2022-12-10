

import 'package:get/get.dart';
import 'package:intertoons/model/cart_model/cart_model.dart';

class CartController extends GetxController {
  final Map<String, CartModelScreen> _cartItems = {};

  Map<String, CartModelScreen> get getCartItems {
    return _cartItems;
  }

  num userCartTotal = 0.0;
  String userCartTotalInString = '';
  var cartLength = 0;

  void addProductToCart(
      {required String productId,
      required int quantity,
      required num productPrice}) {
    _cartItems.putIfAbsent(
        productId,
        () => CartModelScreen(
            productPrice: productPrice,
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
            productPrice: productPrice * value.productQuantity + productPrice,
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
            productPrice: productPrice * value.productQuantity - productPrice,
            id: value.id,
            productId: productId,
            productQuantity: value.productQuantity - 1));

    update();
  }

  void clearTheCart({required String productId}) {
    _cartItems.remove(productId);
    cartLength--;

    update();
  }

  void findTheTotalOfCart() {
    userCartTotal = 0;
    _cartItems.forEach((key, value) {
      userCartTotal = (value.productPrice + userCartTotal);
    });

    userCartTotalInString = userCartTotal.toStringAsFixed(2);
  }

  void cartLengthData() {
    cartLength = _cartItems.length;
    update();
  }
}
