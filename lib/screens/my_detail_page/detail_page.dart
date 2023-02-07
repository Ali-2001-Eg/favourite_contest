

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_basic/screens/my_detail_page/detail_controller.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}
class _DetailPageState extends State<DetailPage> {

  List imgs = [];
  //to load local json file
  _readData() async {
    print('data read');

    await rootBundle.loadString('assets/json/img.json').then((s) {
      setState(() {
        imgs = json.decode(s);
        // print(imgs[1]['img']);

      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _readData();
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final DetailController fav = Get.put(DetailController());
    return Scaffold(
      body: Container(
        color: const Color(0xffc5eff3),
        child: Stack(
          children: [
            Positioned(
              top: 50,
              left: 10,
              child: IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(
                  Icons.arrow_back_ios,
                ),
              ),
            ),
            Positioned(
              top: 120,
              left: 0,
              height: 120,
              child: Container(
                width: width - 50,
                margin: const EdgeInsets.only(
                  left: 25,
                ),
                padding: const EdgeInsets.only(left: 25, right: 25),
                decoration: BoxDecoration(
                    color: Colors.white.withAlpha(150),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                     CircleAvatar(
                      radius: 50,
                      backgroundImage:  AssetImage(
                          Get.arguments['img']
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                     Text(Get.arguments['name']),
                    Expanded(child: Container()),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notifications,
                        color: Colors.blue,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 400,
              child: Container(
                color: Colors.white.withRed(200),
                width: width,
                height: height,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, top: 150),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Total Participants',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            '(11)',
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.copyWith(color: Colors.orangeAccent),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Wrap(
                        children: [
                          for (int i = 0; i <= imgs.length; i++)
                             CircleAvatar(
                              radius: 30,
                              backgroundImage:
                                  AssetImage( 'assets/images/img_2.png'),
                            )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(20)),
                            child: IconButton(
                              onPressed: () {
                                fav.favCounter();
                              },
                              icon: const Icon(
                                Icons.favorite_outline,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Add To Favourite',
                            style:
                                Theme.of(context).textTheme.headline6?.copyWith(
                                      color: Colors.orangeAccent,
                                    ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 280,
              height: 250,
              child: Container(
                width: width - 50,
                margin: const EdgeInsets.only(left: 25, right: 25),
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 10, left: 20, bottom: 40, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          Get.arguments['title'],
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              ?.copyWith(color: Colors.black87)),
                      Text(Get.arguments['text'],
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(color: Colors.grey)),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.watch_later_rounded,
                                color: Colors.blue,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:  [
                                  Text(
                                    Get.arguments['name'],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    'Deadline',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 20),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.attach_money,
                                color: Colors.red,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:  [
                                  Text(
                                      Get.arguments['price'],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    'Price',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 20),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Top Level',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    'Entry',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 20),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
