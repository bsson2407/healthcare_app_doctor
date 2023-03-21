import 'package:get/get.dart';
import 'package:healthcare_app_doctor/modules/home/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
