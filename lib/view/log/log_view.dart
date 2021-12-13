import 'package:admin/constants.dart';
import 'package:admin/utils/responsive.dart';
import 'package:admin/view/components/header.dart';
import 'package:admin/view/dashboard/components/storage_details.dart';
import 'package:admin/view/log/components/log_item_card.dart';
import 'package:admin/view/log/log_logic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

class LogPage extends StatelessWidget {
  final controller = Get.put(LogController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(title: 'teamLog'),
            SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                    child: AnimationLimiter(
                      child: ListView.builder(
                        itemCount: 6,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(milliseconds: 675),
                            child: SlideAnimation(
                              verticalOffset: 50.0,
                              child: FadeInAnimation(
                                child: LogItemCard(
                                  senderName: "senderName",
                                  commitContent: "commitContent",
                                  projectName: "projectName",
                                  time: 'time',
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                if (!Responsive.isMobile(context))
                  Expanded(
                    flex: 2,
                    child: StorageDetails(),
                  ),
              ],
            ),
            /*Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: AnimationLimiter(
                    child: ListView.builder(
                      itemCount: 6,
                      itemBuilder: (BuildContext context, int index) {
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 375),
                          child: SlideAnimation(
                            verticalOffset: 50.0,
                            child: FadeInAnimation(
                              child: LogItemCard(
                                  senderName: "senderName",
                                  commitContent: "commitContent",
                                  projectName: "projectName",
                                  time: 'time'),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                if (!Responsive.isMobile(context))
                  Expanded(
                    flex: 2,
                    child: StorageDetails(),),
              ],
            ),*/
          ],
        ),
      ),
    );
  }
}
