import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:get/get.dart';
import 'package:getx_basic/screens/my_detail_page/detail_page.dart';

import 'package:getx_basic/screens/my_home_page/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      getPages: <GetPage>[
        GetPage(
          name: '/',
          page: () => const MyHomePage(),
        ),
        GetPage(name: '/detail', page: ()=>DetailPage()),
      ],
      initialRoute: '/',
    );
  }
}

// Home Screen
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(40),
                  ),
                  gradient: LinearGradient(
                    colors: [
                      Colors.grey.shade900,
                      Colors.grey.shade600,
                      Colors.grey.shade900
                    ],
                  )),
              child: const Center(
                child: Text(
                  "GetX",
                  style: TextStyle(fontSize: 50, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Center(
                child: Container(
                    width: MediaQuery.of(context).size.width - 20,
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      autocorrect: true,
                      decoration: InputDecoration(
                        hintText: 'Search GetX..',
                        hintStyle: const TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.white70,
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                          borderSide: BorderSide(color: Colors.grey, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50.0)),
                          borderSide: BorderSide(color: Colors.grey.shade100),
                        ),
                      ),
                    ))),
            const SizedBox(
              height: 50,
            ),
            //GetX start from here
            RichText(
                text: TextSpan(
                    text: 'First GetX',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Get.to(
                            () => PageOne(),
                          ),
                    style:
                        TextStyle(color: Colors.grey.shade600, fontSize: 30))),
            const SizedBox(
              height: 10,
            ),
            //Explore GetX
            RichText(
                text: TextSpan(
                    text: 'Explore GetX',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Random random = Random();
                        Get.to(
                          () => PageTwo(),
                          arguments: {
                            'price': random.nextInt(10000).toString(),
                            'text': "The Course price is USD",
                          },
                        );
                      },
                    style:
                        TextStyle(color: Colors.grey.shade600, fontSize: 30))),
            const SizedBox(
              height: 50,
            ),
            const Divider(),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Navigate named routes',
              style: const TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 30,
            ),
            //last two routes/buttons
            Expanded(
                child: Container(
              height: 300,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                ),
                gradient: LinearGradient(
                    colors: [Colors.grey, Colors.black, Colors.grey]),
              ),
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: 200,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            primary: Colors.grey.shade300,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          onPressed: () =>
                              Get.toNamed('/course_page', arguments: {
                            'Price': Random().nextInt(10000).toString() ??
                                'Course Exploration',
                            'text': 'Course Price is in USD',
                          }),
                          child: Text(
                            "Course",
                            style: TextStyle(
                                fontSize: 20, color: Colors.grey.shade900),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Container(
                      width: 200,
                      height: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xFffbc33e)),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: Colors.grey.shade300,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        onPressed: () => Get.toNamed('/more_page/',
                            parameters: {
                              'data': Random().nextInt(100000).toString()
                            }),
                        child: Text(
                          "More",
                          style: TextStyle(
                              fontSize: 20, color: Colors.grey.shade900),
                        ),
                      ),
                    ))
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}

// Page One
class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 200,
          height: 70,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xFffbc33e)),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              primary: Colors.grey.shade300,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            //Get.back equals to Navigator.pop(context)
            //it's better because we don't pass context parameter to load less
            onPressed: () => Get.back(),
            child: Text(
              "Home",
              style: TextStyle(fontSize: 20, color: Colors.grey.shade900),
            ),
          ),
        ),
      ),
    );
  }
}

// Page Two
class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page One'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.grey.shade900, //change your color here
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Random Price : ' + Get.arguments['price'] ??
                    'Exploration Page',
                style: Theme.of(context).textTheme.headline4,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                Get.arguments['text'] ?? 'No Price given',
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Page Three
class PageThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black26),
        title: const Text(
          'Course Page',
          style: TextStyle(fontSize: 30, color: Colors.grey),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Course Price: ' + Get.arguments['Price'].toString(),
              style: TextStyle(fontSize: 30, color: Colors.grey.shade600),
            ),
            Text(Get.arguments['text']),
          ],
        ),
      ),
    );
  }
}

// Page Four
class PageFour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black26,
        ),
        title: const Text('Page Four'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                primary: Colors.transparent,
              ),
              onPressed: () => Get.to(() => PageFive()),
              child: Text(
                'Prince is ' + Get.parameters['data']!,
                style: TextStyle(fontSize: 40, color: Colors.grey),
              ),
            ),
            const Divider(),
            const Text(
              'Page Four',
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}

//Page Five
class PageFive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Page Five'),
        backgroundColor: Colors.red,
      ),
      body: Center(
          child: Container(
        width: 200,
        height: 70,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color(0xFffbc33e)),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: Colors.grey.shade300,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          onPressed: () => Get.to(() => HomePage()),
          child: Text(
            "Home",
            style: TextStyle(fontSize: 20, color: Colors.grey.shade900),
          ),
        ),
      )),
    );
  }
}
