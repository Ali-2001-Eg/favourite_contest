import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../recents_page/recent_contest.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({Key? key}) : super(key: key);

  @override
  State<ContentPage> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  List list = [];
  List info = [];
  //to load local json file
  _readData() async {
    // print('data read');
    await rootBundle.loadString('assets/json/recent.json').then((s) {
      setState(() {
        list = json.decode(s);
      });
    });
    await rootBundle.loadString('assets/json/detail.json').then((s) {
      setState(() {
        info = json.decode(s);
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _readData();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    int _currentIndex = 0;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 70),
        color: const Color(0xFFc5e5f3),
        child: Column(
          children: [
            Container(
              width: width,
              height: 100,
              margin: const EdgeInsets.only(left: 25, right: 25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFFebf8fd),
              ),
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/images/img_1.png'),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Ali Mazen',
                      style: TextStyle(fontSize: 20),
                    ),
                    Expanded(child: Container()),
                    const Icon(
                      Icons.alarm,
                      color: Colors.lightBlue,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Row(
                children: [
                  const Text(
                    'Popular Contests',
                    style: TextStyle(
                      color: Color(0xFF1f2326),
                      fontSize: 20,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  Expanded(child: Container()),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: const Color(0xFffbc33e),
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical:20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      Get.to(()=>RecentContest());
                    },
                    child: Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //page view
            Container(
              height: 220,
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: info.length,
                controller: PageController(viewportFraction: 0.88),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed('/detail', arguments: {
                        'title': info[index]['title'].toString(),
                        'text': info[index]['text'].toString(),
                        'price': info[index]['prize'].toString(),
                        'name': info[index]['name'].toString(),
                        'img': info[index]['img'][0].toString(),
                        'time': info[index]['time'].toString(),
                      });
                    },
                    child: Container(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 10),
                      height: 220,
                      width: width - 20,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: index.isEven ? Colors.lightBlue : Colors.purple,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            info[index]['title'] ?? 'data',
                            style:
                                Theme.of(context).textTheme.headline3?.copyWith(
                                      color: Colors.white,
                                      fontSize: 35,
                                    ),
                          ),
                          Text(
                            info[index]['text'],
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w100),
                          ),
                          const Divider(),
                          Padding(
                            padding: const EdgeInsets.only(
                              bottom: 30,
                              right: 100,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                for (int i = 0; i < 4; i++)
                                  CircleAvatar(
                                    radius: 25,
                                    backgroundImage: AssetImage(
                                      info[index]["img"][i],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
              child: Row(
                children: [
                  const Text(
                    'Recent Contests',
                    style: TextStyle(
                      color: Color(0xFF1f2326),
                      fontSize: 20,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  Expanded(child: Container()),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: const Color(0xFffbc33e),
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical:20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      Get.to(()=>RecentContest());
                    },
                    child: Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
                height: 250,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      for (var i = 0; i < list.length; i++)
                        Row(
                          children: [
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 25, bottom: 25),
                              padding: const EdgeInsets.only(
                                  left: 25, top: 10, bottom: 10),
                              width: width - 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: const Color(0xFFebf8fd),
                              ),
                              child: Row(
                                children: [
                                   CircleAvatar(
                                    radius: 40,
                                    backgroundImage:
                                        AssetImage(list[i]['img']),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        list[i]['status'],
                                        style:
                                            Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.orangeAccent),
                                      ),
                                      Text(
                                        list[i]['text'],
                                        style:
                                            Theme.of(context).textTheme.bodyText1,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
