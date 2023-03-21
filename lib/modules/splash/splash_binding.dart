import 'package:get/get.dart';
import 'package:healthcare_app_doctor/modules/splash/splash_controller.dart';
import 'package:healthcare_app_doctor/repository/appointment.repository.dart';
import 'package:healthcare_app_doctor/repository/chat.repository.dart';
import 'package:healthcare_app_doctor/repository/health_record.repository.dart';
import 'package:healthcare_app_doctor/repository/user.repository.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
    Get.lazyPut(() => UserRepository(), fenix: true);
    Get.lazyPut(() => HealthRecordRepository(), fenix: true);
    Get.lazyPut(() => AppointmentRepository(), fenix: true);
    Get.lazyPut(() => ChatRepository(), fenix: true);
  }
}
