import 'dart:async';
import 'dart:math';

class Delay {
  static range(
    FutureOr<dynamic> Function()? function, {
    int start = 1000,
    int end = 1500,
  }) {
    Random random = Random();
    int time = random.nextInt(end - start) + start;
    Future.delayed(Duration(milliseconds: time), function);
  }
}
