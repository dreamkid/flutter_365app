import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_365app/common/AppUtils.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// 首页
class HomeRouter extends StatelessWidget{
  DateTime _lastQuiteTime;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    return WillPopScope(child: Scaffold(
      body: Center(
        child: Text("Home"),
      ),
    ), onWillPop: ()async{
      if(_lastQuiteTime == null||DateTime.now().difference(_lastQuiteTime).inSeconds>1){
        Fluttertoast.showToast(msg: "再按一次退出应用");
        _lastQuiteTime = DateTime.now();
        return false;
      }else{
        // AndroidBackTop.backDeskTop();// 退出但不关闭应用
        AppUtils.pop(animated: false);
        return false;
      }

    });
  }

}