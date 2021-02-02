import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_365app/common/AppUtils.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// 首页
class HomePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<HomePage>{
  DateTime _lastQuiteTime;
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
   SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
   return WillPopScope(
       child: Scaffold(
         appBar: AppBar(
           toolbarHeight: 0,
           // title: ,
         ),
         bottomNavigationBar: BottomNavigationBar(
           items: [
             BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
             BottomNavigationBarItem(icon: Icon(Icons.videocam), label: "小视频"),
             BottomNavigationBarItem(icon: Icon(Icons.live_tv), label: "直播"),
             BottomNavigationBarItem(icon: Icon(Icons.person_pin_outlined), label: "我的"),
           ],
           type: BottomNavigationBarType.fixed,
           currentIndex: _selectedIndex,
           fixedColor: Colors.blue,
           onTap: _onItemTapped,
           unselectedIconTheme: IconThemeData(
             color: Colors.black,
           ),
           unselectedItemColor: Colors.black,
           unselectedLabelStyle: TextStyle(
             color: Colors.black,
             fontSize:12
           ),
           selectedLabelStyle: TextStyle(
             color: Colors.blue,
             fontSize: 12
           ),
           // backgroundColor: Colors.teal,
         ),
         body: Center(
           child: Text("Home"),
         ),
       ),
       onWillPop: () async {
         if (_lastQuiteTime == null ||
             DateTime.now().difference(_lastQuiteTime).inSeconds > 1) {
           Fluttertoast.showToast(msg: "再按一次退出应用");
           _lastQuiteTime = DateTime.now();
           return false;
         } else {
           // AndroidBackTop.backDeskTop();// 退出但不关闭应用
           AppUtils.pop(animated: false);
           return false;
         }
       });
  }
  

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
