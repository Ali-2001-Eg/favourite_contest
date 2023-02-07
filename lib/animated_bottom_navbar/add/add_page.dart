import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_basic/animated_bottom_navbar/add/add_controller.dart';



class AddPage extends GetView<AddController> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(()=>
              Text(
                  controller.counter.toString()
              ),),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary:Colors.redAccent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    )
                ),
                child: const Text("Increase"),
                onPressed: (){
                controller.increment();
                print(controller.counter.obs);
                },
              ),


            ],
          ),
        ),
      ),
    );;
  }
}