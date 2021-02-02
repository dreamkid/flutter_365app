import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
/// 可选主题
const  _themes = <MaterialColor>[
  Colors.blue,
  Colors.cyan,
  Colors.teal,
  Colors.green,
  Colors.red
];
class Global{
  // 全局SharedPreferences
  static SharedPreferences _prefs;
  // 全局主题配置
  static List<MaterialColor> get themes => _themes;
  // 是否是release版本
  static bool get isRelease => bool.fromEnvironment("dart.vm.product");

  /// global init
  static Future init() async{
    _prefs =  await SharedPreferences.getInstance();
  }

  /// 获取pref实例
  static SharedPreferences get prefs => _prefs;

}