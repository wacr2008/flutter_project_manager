//参照i山大格式

import 'dart:math';

import 'package:admin/utils/sharedpreference_util.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Connection {
  static Dio _instance =  Dio();
  static SharedPreferences _s = SharedPreferenceUtil.instance;

  static Dio dio() {
      _instance.options.baseUrl = 'http://localhost:8081/';
    return _instance;
  }

  static String? getToken(){
    return _s.getString('token');
  }
}

class UserAPI{
  static String _technicianUrlPOST = 'user/technician';

  Future<List<String>> getTechnicianList() async {
    try {
      Response response = await Connection.dio().post(
          _technicianUrlPOST,
          options: Options(headers: {'token': Connection.getToken()}));
      if(response.data['code'] == 0){
        List<dynamic> data = response.data['data'];
        List<String> result = [];
        data.forEach((element) {
          result.add(element);
        });
        return result;
      }
      return [];
    } on DioError {
      print(DioError);
      return [];
    }
  }

}

class DemandAPI{
  static String _createDemandUrlPOST = '/demand/create';
  static String _doingDemandUrlPOST = '/demand/doing';
  static String _doneDemandUrlPOST = '/demand/done';
  static String _uploadDemandAddressUrlPOST = '/demand/github';
  static String _uploadDemandFileUrlPOST = '/demand/upload';
  static String _downloadDemandFileUrlPOST = '/demand/download';
  static String _changeDemandStatusUrlPOST = '/demand/';

  Future<int> createDemand(String title, String project, String ddl,
      String doer, int priority) async {
    try {
      Response response = await Connection.dio().post(
        _createDemandUrlPOST,
        options: Options(headers: {'token': Connection.getToken()}),
        queryParameters: {
          'title': title,
          'project': project,
          'ddl': ddl,
          'doer' : doer,
          'priority' : priority
        },
      );
      return response.data['code'];

    } on DioError {
      print(DioError);
      return -1;
    }
  }
}