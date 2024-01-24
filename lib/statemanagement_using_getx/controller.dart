import 'package:get/get.dart';

class CounterController extends GetxController {
  var count = 0.obs; // "obs" stands for observable

  void increment() {
    count++;
  }

  void decrement() {
    count--;
  }
}
