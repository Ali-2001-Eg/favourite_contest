import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_basic/animated_bottom_navbar/home/home_controller.dart';
//Get view extends stateless class and provide the class with controller
//as like as GetBuilder or Get.find
class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Text(
          controller.title,
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: const Center(
          child: Text(
            "Home Page",
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}