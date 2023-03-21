import 'package:get/get.dart';
import 'package:healthcare_app_doctor/modules/sign_up/sign_up_controller.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpController());
  }
}
