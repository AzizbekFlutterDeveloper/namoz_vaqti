import 'dart:io';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class NewsApiService {
  static List? datas = [];
  static int day = DateTime.now().day;
  static int month = DateTime.now().month;
  static String city = "Toshkent";
  static Future getNewsApi() async {
    await openBox();
    Response res;
    try {
      res = await Dio().get("https://namozvaqti.herokuapp.com/api/monthly?region=$city&month=$month");
      await putData(res.data);
    } catch (e) {
      print("Xatooooo");
    }

    List myData = box!.values.toList();

    if (myData.isEmpty) {
      datas!.add("nodata");
    } else {
      datas = myData;
      
    }

    return true;
  }

  static Box? box;
  static Future openBox() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);
  }

  static putData(var data) async {
    box = await Hive.box("data");
    await box!.clear();
    for (var d in data) {
      if(d['day'] == day){
        await box!.add(d);
      }
    }
  }

  
  
}