import 'package:get/get.dart';

abstract class UppDurations {
  ///1000 milisecond
  static Duration get verySlow => 1.seconds;

  ///700 milisecond
  static Duration get slow => .7.seconds;

  ///500 milisecond
  static Duration get normal => .5.seconds;

  ///300 milisecond
  static Duration get fast => .3.seconds;

  ///150 milisecond
  static Duration get verFast => .15.seconds;
}
