import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intertoons/controller/cart_controller/cart_controller.dart';
import 'package:intertoons/controller/const/color%20const/colors.dart';
import 'package:intertoons/model/cart_model/cart_model.dart';


showAlertDialogCartScreen({
  required BuildContext context,
  required String itemName,
  required CartModelScreen cartModel,
}) {

  final cartControler = Get.put(CartController());  
  Widget cancelButton = TextButton(
    child: Text(
      "Cancel",
      style: TextStyle(color: blackColour, fontWeight: FontWeight.w500),
    ),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = TextButton(
    child: Text("Continue",
        style: TextStyle(color: greenColour, fontWeight: FontWeight.w500)),
    onPressed: () {
        cartControler.clearTheCart(
                                productId: cartModel.productId);
                                 Navigator.of(context).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Remove Item From Cart",
        style: TextStyle(color: greenColour, fontWeight: FontWeight.w500)),
    content: Text("$itemName Will be removed from your cart?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}







showAlertDialogHome({
  required BuildContext context,
  required String itemName,
  required String productId,
}) {

  final cartControler = Get.put(CartController());  
  Widget cancelButton = TextButton(
    child: Text(
      "Cancel",
      style: TextStyle(color: blackColour, fontWeight: FontWeight.w500),
    ),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = TextButton(
    child: Text("Continue",
        style: TextStyle(color: greenColour, fontWeight: FontWeight.w500)),
    onPressed: () {
        cartControler.clearTheCart(
                                productId: productId);
                                 Navigator.of(context).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Remove Item From Cart",
        style: TextStyle(color: greenColour, fontWeight: FontWeight.w500)),
    content: Text("$itemName Will be removed from your cart?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
