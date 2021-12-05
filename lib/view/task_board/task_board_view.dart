import 'package:admin/utils/responsive.dart';
import 'package:admin/view/components/header.dart';
import 'package:admin/view/dashboard/components/storage_details.dart';
import 'package:admin/view/task_board/components/all_tasks.dart';
import 'package:admin/view/task_board/task_board_logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';


class TaskBoardPage extends StatelessWidget {
  final logic = Get.put(TaskBoardLogic());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(title: '需求面板',),
            SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      AllTasks(),
                      // if (Responsive.isMobile(context))
                        SizedBox(height: defaultPadding),
                      // if (Responsive.isMobile(context))
                        StorageDetails(),
                    ],
                  ),
                ),
                // if (!Responsive.isMobile(context))
                //   SizedBox(width: defaultPadding),
                // // On Mobile means if the screen is less than 850 we dont want to show it
                // if (!Responsive.isMobile(context))
                //   Expanded(
                //     flex: 2,
                //     child: StorageDetails(),
                //   ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
