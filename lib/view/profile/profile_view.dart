import 'package:admin/view/profile/components/linear_chart_card.dart';
import 'package:admin/view/profile/profile_logic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:timelines/timelines.dart';

class ProfilePage extends StatelessWidget {
  final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: Column(
              children: [
                // Text("profile",style: Theme.of(context).textTheme.headline6, textAlign: TextAlign.left,),
                Container(
                  margin: EdgeInsets.only(left: 36, top: 36, bottom: 36),
                  padding: EdgeInsets.fromLTRB(30, 30, 16, 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    // border: new Border.all(color: Colors.white54, width: 0.5),
                    // color: Color(0xff292b49),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff292b49),
                        Color(0xFF161B24),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          ClipOval(
                            /*child: Container(
                            height: 180,
                            width: 180,
                            color: Colors.blueAccent,
                            child: Center(
                              child: Text(
                                "S",
                                style: TextStyle(fontSize: 80),
                              ),
                            ),
                          ),*/
                            child: ClipOval(
                              child: Image.asset(
                                'images/lzw_img.png',
                                fit: BoxFit.fill,
                                width: 180,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 40, right: 80),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "用户名",
                              style: TextStyle(fontSize: 50),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "暂未设置邮箱",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "修改密码",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 36),
                  width: 520,
                  child: LinearChartCard(),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 36, top: 36, right: 36),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    // border: new Border.all(color: Colors.white54, width: 0.5),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff292b49),
                        Color(0xFF161B24),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  // height: 700,
                  // width: 300,
                  constraints: BoxConstraints(
                    minHeight: 650,
                    maxHeight: 700,
                    // maxWidth: 450,
                    minWidth: 300,
                  ),
                  child: Timeline.tileBuilder(
                    builder: TimelineTileBuilder.fromStyle(
                      contentsAlign: ContentsAlign.alternating,
                      oppositeContentsBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(24),
                        child: Text(
                          "2021.12.15",
                          style: TextStyle(color: Colors.grey),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      contentsBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(24),
                        child: Text(
                          "this is my commit information",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                      ),
                      itemCount: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
