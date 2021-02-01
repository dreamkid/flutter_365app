import 'package:flutter/services.dart';

/// 工具类
class AppUtils{
  static Future<void> pop({bool animated}) async {
    await SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop', animated);
  }
}