import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_basic/cart/total_page.dart';

import 'my_controller.dart';

class MyCart extends StatelessWidget {
  MyCart({Key? key}) : super(key: key);
  //as like as lazy put method to initialize new controllers and repos
  final MyController _controller = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                const Text(
                  'Books',
                  style: const TextStyle(color: Colors.amber, fontSize: 30),
                ),
                Expanded(child: Container()),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.redAccent,
                  ),
                  child: GestureDetector(
                      onTap: () {
                        _controller.plusOneBook();
                        print(_controller.books);
                      },
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      )),
                ),
                const SizedBox(
                  width: 20,
                ),
                //special widget from get x to view a stateful widget
                Obx(
                  () => Text(
                    _controller.books.toString(),
                    style: const TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.redAccent,
                  ),
                  child: GestureDetector(
                      onTap: () {
                        _controller.minusOneBook();
                        print(_controller.books.obs);
                      },
                      child: const Icon(
                        Icons.remove,
                        color: Colors.white,
                      )),
                ),
              ],
            ),
            SizedBox(height: 30,),
            Row(
              children: [
                const Text(
                  'Pens',
                  style: const TextStyle(color: Colors.amber, fontSize: 30),
                ),
                Expanded(child: Container()),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.redAccent,
                  ),
                  child: GestureDetector(
                      onTap: () {
                        _controller.plusOnePen();
                        print(_controller.pens);
                      },
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      )),
                ),
                const SizedBox(
                  width: 20,
                ),
                //special widget from get x to view a stateful widget
                Obx(
                  () => Text(
                    _controller.pens.toString(),
                    style: const TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.redAccent,
                  ),
                  child: GestureDetector(
                      onTap: () {
                        _controller.minusOnePen();
                        print(_controller.pens.obs);
                      },
                      child: const Icon(
                        Icons.remove,
                        color: Colors.white,
                      )),
                ),
              ],
            ),
            SizedBox(height: 30,),

            Row(
              children: [
                Expanded(child: Container()),
                Container(
                  width: 140,
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
                      Get.to(()=>TotalPage(),transition: Transition.leftToRight);
                    },
                    child: Text('Total',style: TextStyle(
                      fontSize: 30,
                      color: Colors.white
                    ),),
                  ),
                )
              ],
            )

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()
        {
          _controller.reset();
          print(_controller.books);
          print(_controller.pens);
        },
        child: const Text('RESET'),
      ),
    );
  }
}
