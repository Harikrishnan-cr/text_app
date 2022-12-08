import 'package:get/get.dart';
import 'package:intertoons/model/cart_model/cart_model.dart';

class CartController extends GetxController {
  final Map<String, CartModelScreen> _cartItems = {};

  Map<String, CartModelScreen> get getCartItems {
    return _cartItems;
  }

  void addProductToCart({required String productId, required int quantity}) {
    _cartItems.putIfAbsent(
        productId,
        () => CartModelScreen(
            id: DateTime.now().toString(),
            productId: productId,
            productQuantity: quantity));
  }
}
