
import 'package:flutter/gestures.dart';
import 'gesture_channel.dart';

class PointerTracker extends PanGestureRecognizer {

  bool _isFlutterGestureWorking = false;

  @override
  void rejectGesture(int pointer) {
    // TODO: implement rejectGesture
    super.rejectGesture(pointer);
    _isFlutterGestureWorking = true;
    _notify();
  }

  @override
  void acceptGesture(int pointer) {
    // TODO: implement acceptGesture
    super.acceptGesture(pointer);
    _isFlutterGestureWorking = false;
    _notify();
  }

  void _notify() {
    GestureChannel.gestureStateChanged(flag: _isFlutterGestureWorking);
  }

}