import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:healthcare_app_doctor/repository/user.repository.dart';
import 'package:healthcare_app_doctor/routes/app_routes.dart';
import 'package:healthcare_app_doctor/service/local_storage_service.dart';

class PersonalController extends GetxController {
  final userRepository = Get.find<UserRepository>();

  @override
  void onInit() {
    super.onInit();
    getMe();
  }

  void getMe() async {
    try {
      final user = await userRepository.getMe();
      print("object__${user}");
      LocalStorageService.setId(user.data?.memberId as String);
    } catch (err) {}
  }

  void logout() async {
    // final client = RestClient(dio);

    // try {
    //   await userRepository.logout().then((value) {
    LocalStorageService.setAccessToken("");

    Get.offAllNamed(AppRoutes.LOGIN);
    //   });
    // } on DioError catch (e) {
    //   EasyLoading.showError(e.response?.data['message']);
    // }
  }
}
