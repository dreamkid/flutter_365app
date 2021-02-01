import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AndroidBackTop{
  static const String CHANNEL = "android/back/desktop";
  static Future<bool> backDeskTop() async {
    final platform = MethodChannel(CHANNEL);
    try{
      final bool out = await platform.invokeMethod<bool>("backDesktop");
      // ignore: unrelated_type_equality_checks
      if(out is bool && out == true) {
        debugPrint("返回桌面");
      }
    }on PlatformException catch(e){
      debugPrint("通信失败");
      print(e.toString());
    }
    return Future.value(false);
  }
}