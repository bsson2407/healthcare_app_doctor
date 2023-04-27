import 'package:get/get.dart';
import 'package:healthcare_app_doctor/modules/change-password/change_password_controller.dart';

class ChangePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChangePasswordController());
  }
}
