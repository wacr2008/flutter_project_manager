import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddDemandLogic extends GetxController {
  RxBool hasInputTitle = true.obs;
  final TextEditingController titleController = TextEditingController();
  RxString selectedDeadLine = '未选择截止日期'.obs;

  List<String> _managerList = [
    "15路",
    "15路区间",
    "15路体育场1",
    "15路体育场2",
    "15路体育场3",
    "15路体育场4",
    "15路体育场5",
  ];
  List<DropdownMenuItem<String>> managerItems = [];
  RxString selectedManager = "".obs;

  List<String> _priorityList = [
    "低",
    "中",
    "高",
  ];
  List<DropdownMenuItem<String>> priorityItems = [];
  RxString selectedPriority = "".obs;
  @override
  void onInit() {
    super.onInit();
    selectedManager.value = _managerList[0];
    selectedPriority.value = _priorityList[0];
    _initManagerItems();
    _initPriorityItems();
  }

  void _initManagerItems() {
    managerItems =
        _managerList.map<DropdownMenuItem<String>>((String managerName) {
          return DropdownMenuItem(
            value: managerName,
            child: Text(
              managerName,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          );
        }).toList();
  }

  void _initPriorityItems() {
    priorityItems =
        _priorityList.map<DropdownMenuItem<String>>((String priority) {
          return DropdownMenuItem(
            value: priority,
            child: Text(
              priority,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          );
        }).toList();
  }
}
class AddDemandBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddDemandLogic());
  }
}
