import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class RecentContest extends StatefulWidget {
  const RecentContest({Key? key}) : super(key: key);

  @override
  State<RecentContest> createState() => _RecentContestState();
}

class _RecentContestState extends State<RecentContest> {

  List info = [];
  //to load local json file
  _readData() async {
    print('data read');
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
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height ;
    return Scaffold(
      backgroundColor: Color(0xffcbe6f6),
      body: Stack(
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
          Container(
            height: height,
          margin: EdgeInsets.only(top: 100,left: 30,right: 10),
          child: Expanded(child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                for(int index=0;index<info.length;index++)
                GestureDetector(
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
                    height: 280,
                    width: width- 20,
                    margin: const EdgeInsets.only(right: 10,bottom: 30),
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
                ),
              ],
            ),
          ),),
          ),
        ],
      ),
    );
  }
}
