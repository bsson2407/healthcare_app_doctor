import 'package:get/get.dart';
import 'package:healthcare_app_doctor/modules/login/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
