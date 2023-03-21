import 'package:get/get.dart';
import 'package:healthcare_app_doctor/modules/bmi/bmi_controller.dart';

class BmiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BmiController());
  }
}
