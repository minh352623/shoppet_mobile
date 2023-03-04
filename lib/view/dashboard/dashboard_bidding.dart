import 'package:get/get.dart';
import 'package:shoppet/controller/dashboard_controller.dart';

class DashboardBidding extends Bindings{

  @override
  void dependencies(){
    Get.put(DashboardController());
  }

}