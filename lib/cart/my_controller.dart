import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyController extends GetxController {
  //obs refers to a stateful variable
  var books = 0.obs;
  var pens = 0.obs;
  num get sum => books.value + pens.value;
  void plusOneBook() {
    books.value++;
  }

  void minusOneBook() {
    if (books.value <= 0) {
      Get.snackbar(
        'Buying Books',
        'Cannot be less than zero',
        icon: Icon(Icons.alarm),
        barBlur: 20,
        isDismissible: true,
        duration: Duration(seconds: 3),
        dismissDirection: DismissDirection.horizontal,
      );
    } else {
      books.value--;
    }
  }

  void plusOnePen() {
    pens.value++;
  }

  void minusOnePen() {
    if (pens.value <= 0) {
      Get.snackbar(
        'Buying Pens',
        'Cannot be less than zero',
        icon: Icon(Icons.alarm),
        barBlur: 20,
        isDismissible: true,
        duration: Duration(seconds: 3),
        dismissDirection: DismissDirection.horizontal,
      );
    } else {
      pens.value--;
    }
  }

  void reset() {
      //value is the setter that will show on the screen
      books.value = 0;
      pens.value = 0;

  }
}
