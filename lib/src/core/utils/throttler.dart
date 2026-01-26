import 'dart:async';

class Throttler {
  final int milliseconds;
  bool _isReady = true;

  Throttler({this.milliseconds = 500});

  void run(void Function() action) {
    if (_isReady) {
      _isReady = false;
      action();
      Timer(Duration(milliseconds: milliseconds), () {
        _isReady = true;
      });
    }
  }
}
