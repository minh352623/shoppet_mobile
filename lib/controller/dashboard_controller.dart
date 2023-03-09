import 'package:get/get.dart';

class DashboardController extends GetxController {
  static  DashboardController instance = Get.find();

  var tabIndex = 0;
//https://stackoverflow.com/questions/66099917/flutter-getx-controller-not-updated-when-data-changed
  void updateIndex(int index) {
    tabIndex = index;
    update();
  }
}
