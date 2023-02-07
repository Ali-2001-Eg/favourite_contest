import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_basic/cart/my_cart.dart';
import 'package:getx_basic/cart/my_controller.dart';
import 'my_controller.dart';
class TotalPage extends StatelessWidget {
   TotalPage({Key? key}) : super(key: key);
  final MyController _controller = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Obx(()=> Text(
              'Total items:\n \t\t\t\t\t\t\t ${_controller.sum}',
              style: TextStyle(
                fontSize: 30,
                color: Colors.blue,
              ),
            ),
            ),
            const SizedBox(height: 30,),
            Container(
              width: 200,
              height: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.blue.shade900
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    )
                ),
                onPressed: (){
                  Get.to(()=>MyCart(),transition: Transition.rightToLeft);
                },
                child:const Text('Go back',style: TextStyle(
                    fontSize: 30,
                    color: Colors.white
                ),),
              ),
            )

          ],
        ),
      ),
    );
  }
}
