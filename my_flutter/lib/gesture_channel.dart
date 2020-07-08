
import 'package:flutter/services.dart';

class GestureChannel {

  static const _channel = const MethodChannel('infoNews/basic_info');

  // ignore: missing_return
  static Future<void> gestureStateChanged({bool flag}) async {
    await _channel.invokeMethod('gestureStateChanged', flag);
  }

}