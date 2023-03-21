import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';


class SplashController extends GetxController {
  // final userRepository = Get.find<UserRepository>();

  // @override
  // void onInit() {
  //   super.onInit();
  //   init();
  // }

  void init() async {
    // var phone = LocalStorageService.getPhone();
    // var password = LocalStorageService.getPassword();
    // if (phone != "" && password != "") {
    //   try {
    //     await userRepository
    //         .loginUser(LoginRequest(phone: phone, password: password))
    //         .then((value) {
    //       LocalStorageService.setAccessToken(
    //           value.data?.access_token as String);

    //       Get.offAllNamed(AppRoutes.MAIN_NAVIGATION);
    //     });
    //   } on DioError catch (e) {
    //     EasyLoading.showError(e.response?.data['message']);
    //   }
    // }
  }
}
