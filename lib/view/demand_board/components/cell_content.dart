import 'package:admin/utils/sharedpreference_util.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../components/color_hex.dart';
import 'flow_chart.dart';

/// 封面
Widget taskCardCover({required int id, required String taskState,
  required String taskPriority, required String taskTitle, required String taskCreater,
  required String taskCreateTime, required String taskManager, required String taskDeadLine}) {
  double height = 165.0;
  return ClipRRect(
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
    child: Container(
      height: height,
      child: Row(
        children: [
          Container(
            width: 88,
            color: HexColor.fromHex('5D4A99'),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '$id',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                Text.rich(
                      TextSpan(
                        text: taskState,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                      ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              height: double.infinity,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 64,
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Text(
                                taskTitle,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                )
                            ),
                            Spacer(),
                            Text(
                              '优先级:  $taskPriority',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      explainText('创建人', taskCreater),
                      explainText('创建时间', taskCreateTime),
                      explainText('负责人', taskManager),
                      explainText('截止时间', taskDeadLine),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}

/// 展开后的封面
Widget taskCardDetailCover({required int id, required String taskState, required String taskCreater,
    required String taskCreateTime, required String taskManager, required String taskDeadLine}) {
 SharedPreferences s = SharedPreferenceUtil.instance;
  return Container(
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: 44,
          color: HexColor.fromHex('5D4A99'),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 28,),
              Text(
                '$id',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              Expanded(child: SizedBox(width: 12,)),
              Text(
                '状态',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              Expanded(child: SizedBox(width: 12,)),
              if(s.getString('identity') == '产品')
                createrMenu,
              if(s.getString('identity') == '技术')
                managerMenu,
            ],
          ),
        ),
        Stack(
          children: [
            Image.asset(
              'assets/images/taskCardBackgroundImage.png',
              width: double.infinity,
              height: 86,
              fit: BoxFit.cover,
            ),
            Positioned.fill(
              bottom: 12,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  explainText('创建人', taskCreater, subtitleColor: Colors.white),
                  explainText('创建时间', taskCreateTime, subtitleColor: Colors.white),
                  explainText('负责人', taskManager, subtitleColor: Colors.white),
                  explainText('截止时间', taskDeadLine, subtitleColor: Colors.white),
                ],
              ),
            ),
          ],
        )
      ],
    ),
  );
}

PopupMenuButton managerMenu = new PopupMenuButton<String>(
    onSelected: (String value) {

    },
    itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
          PopupMenuItem(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Icon(
                  Icons.download_done,
                  color: Colors.black,
                ),
                Text('已完成该需求'),
              ],
            ),
            value: '完成',
          ),
          PopupMenuItem(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Icon(
                  Icons.highlight_off,
                  color: Colors.black,
                ),
                Text('拒绝该需求')
              ],
            ),
            value: '拒绝',
          ),
        ]
);

PopupMenuButton createrMenu = new PopupMenuButton<String>(
    onSelected: (String value) {

    },
    itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
      PopupMenuItem(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(Icons.download_done,color: Colors.black,),
            Text('需求验收通过'),
          ],
        ),
        value: '通过',
      ),
      PopupMenuItem(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(Icons.highlight_off,color: Colors.black,),
            Text('需求验收未通过'),
          ],
        ),
        value: '未通过',
      )
    ]);

/// 标题（第一行
Widget taskCardTitleComponent({required String taskTitle, required String taskPriority}) {
  return Container(
    color: Colors.white,
    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(width: 12,),
            Text(
              taskTitle,
              style: TextStyle(
               color: Colors.black,
               fontWeight: FontWeight.bold,
               fontSize: 24,
             ),
           ),
            Spacer(),
            Text(
              taskPriority,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
              ),
            ),
            Spacer(),
          ],
        ),
        // Divider(
        //   color: Colors.grey[300],
        // ),
      ],
    ),
  );
}

/// 流程（第二行
Widget taskCardFlowChartComponent({required flowInfo}) {
  List flow = ['已创建','审核中','执行中'];
  return Container(
    color: Colors.white,
    padding: EdgeInsets.fromLTRB(22, 0, 10, 0),
    child: flowChart(flowInfo: flow),
  );
}

/// 下载文档
Widget taskCardGetFileComponent() {
  return ClipRRect(
    borderRadius: BorderRadius.vertical(bottom: Radius.circular(8)),
    child: Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 0,
              primary: HexColor.fromHex('FEBE16'),
            ),
            onPressed: () {

            },
            child: Container(
              height: 36,
              child: Center(
                child: Text(
                  '下载需求文档',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Text('5 人已下载需求文档', style: TextStyle(
            color: Colors.grey,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ))
        ],
      ),
    ),
  );
}

/// 三行文字
Widget multipleLineText(String line1, String line2, String line3) {
  return Text.rich(
    TextSpan(
      style: TextStyle(
        height: 1.4,
      ),
      children: [
        TextSpan(
          text: '$line1\n',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        ),
        TextSpan(
          text: '$line2\n',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        TextSpan(
          text: line3,
          style: TextStyle(
            color: Colors.black87,
            fontSize: 12,
          ),
        ),
      ],
    ),
  );
}

///
Widget explainText(String title, String subtitle,
    {Color? titleColor, Color? subtitleColor}) {
  return Text.rich(
    TextSpan(
        style: TextStyle(
          height: 1.4,
        ),
        children: [
          TextSpan(
              text: '$title\n',
              style: TextStyle(
                color: titleColor ?? Colors.grey,
                fontSize: 13,
              )),
          TextSpan(
            text: subtitle,
            style: TextStyle(
              color: subtitleColor ?? Colors.blueGrey,
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
        ]),
  );
}
