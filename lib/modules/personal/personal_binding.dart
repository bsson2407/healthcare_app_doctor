import 'package:get/get.dart';
import 'package:healthcare_app_doctor/modules/personal/personal_controller.dart';

class PersonalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PersonalController());
  }
}
