import 'package:get/get.dart';
import 'package:healthcare_app_doctor/modules/infor/infor_controller.dart';

class InforBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InforController());
  }
}
