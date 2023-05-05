import 'package:get/get.dart';
import 'package:healthcare_app_doctor/models/login/login_request.dart';
import 'package:healthcare_app_doctor/repository/user.repository.dart';
import 'package:healthcare_app_doctor/routes/app_routes.dart';
import 'package:healthcare_app_doctor/service/auth_service.dart';
import 'package:healthcare_app_doctor/service/local_storage_service.dart';

class OtpController extends GetxController {
  var authService = Get.find<AuthService>();
  final userRepository = Get.find<UserRepository>();

  LoginRequest data = Get.arguments;
  void verifyOTP(String otp) async {
    bool check = await authService.verifyOTP(otp);
    // ignore: unrelated_type_equality_checks
    if (check) {
      await userRepository
          .loginUser(LoginRequest(phone: data.phone, password: data.password))
          .then((value) {
        LocalStorageService.setAccessToken(value.data?.access_token as String);
        LocalStorageService.setRefreshToken(
            value.data?.refresh_token as String);
        // LocalStorageService.setPhone(data.phone);
        // LocalStorageService.setPassword(data.password);

        // Get.offAllNamed(AppRoutes.SELECT_DOCTOR_PAGE);
      });
    }
  }
}
