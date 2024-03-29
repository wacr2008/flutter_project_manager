import 'package:admin/models/allNeeds.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';
import 'folding_cell.dart';

class AllMyDemands extends StatelessWidget {
  const AllMyDemands({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Set<int> openedIndices = {};
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "所有需求",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            width: double.infinity,
            // height: double.infinity,
            child:  ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return FoldingCell(
                  key: ValueKey(index),
                  id: index + 1,
                  taskState: AllNeeds.allNeeds[0]['taskState'],
                  taskPriority: '高',
                  taskTitle: '标题',
                  timeLineInfo: [],
                  taskProject: '2333',
                  taskCreater: 'zwn',
                  taskCreateTime: '2021-12-3 08:00',
                  taskManager: 'whc',
                  taskDeadLine: '2021-12-3 09:00',
                  foldingState: openedIndices.contains(index) ? FoldingState.open : FoldingState.close,
                  onChanged: (foldState) {
                    if (foldState == FoldingState.open) {
                      // print('打开了 cell -- $index');
                      openedIndices.add(index);
                    } else {
                      // print('关闭了 cell -- $index');
                      openedIndices.remove(index);
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}