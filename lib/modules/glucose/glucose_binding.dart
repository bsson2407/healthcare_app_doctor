import 'package:get/get.dart';
import 'package:healthcare_app_doctor/modules/glucose/glucose_controller.dart';
class GlucoseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GlucoseController());
  }
}
