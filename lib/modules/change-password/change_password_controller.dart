import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:healthcare_app_doctor/repository/user.repository.dart';

class ChangePasswordController extends GetxController {
  final userRepository = Get.find<UserRepository>();
  var formKey = GlobalKey<FormState>();
  var formKeyDialog = GlobalKey<FormState>();
  var oldPasswordController = TextEditingController();
  var newPasswordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var isError = '';
  var isObscureOldPassword = true.obs;
  var isObscureNewPassword = true.obs;
  var isObscureConfirmPassword = true.obs;
  var isButtonLoading = false.obs;
  var isButtonLoadingDialog = false.obs;

  void changePassword(
      String oldPassword, String newPassword, String confirmNewPassword) async {
    if (formKey.currentState!.validate()) {
      isButtonLoading.value = true;
      try {
        await userRepository
            .changePassword(oldPassword, newPassword, confirmNewPassword)
            .then((value) {
          Get.back();
        });
      } on DioError catch (e) {
        isButtonLoading.value = false;

        EasyLoading.showError(e.response?.data['message']);
      }
    }

    isButtonLoading.value = false;
  }
}
