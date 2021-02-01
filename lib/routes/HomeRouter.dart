import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// 首页
class HomeRouter extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text("首页"),

      ),
      body: Center(
        child:
        Text("主页"),
      ),
    ),
    top: false,);
  }

}