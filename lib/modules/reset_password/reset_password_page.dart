import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_app_doctor/components/auth_button.dart';
import 'package:healthcare_app_doctor/modules/change-password/change_password_controller.dart';
import 'package:healthcare_app_doctor/modules/reset_password/reset_password_controller.dart';
import 'package:healthcare_app_doctor/routes/app_routes.dart';

class ResetPasswordPage extends StatelessWidget {
  ResetPasswordPage({Key? key}) : super(key: key);
  final resetPasswordController = Get.find<ResetPasswordController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            color: Colors.blue,
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: Form(
          key: resetPasswordController.formKey,
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(36),
              width: Get.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Đổi mật khẩu".tr,
                    style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Obx(
                    () => _buildPasswordField(
                        resetPasswordController.newPasswordController,
                        "Mật khẩu mới",
                        resetPasswordController.isObscureNewPassword),
                  ),
                  const SizedBox(height: 20),
                  Obx(
                    () => _buildPasswordField(
                        resetPasswordController.confirmPasswordController,
                        "Nhập lại mật khẩu mới",
                        resetPasswordController.isObscureConfirmPassword),
                  ),
                  const SizedBox(height: 40),
                  _buildSignInButton(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Obx _buildSignInButton() {
    return Obx(
      () => AuthButton(
        widget: resetPasswordController.isButtonLoading.isTrue
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : Text(
                "Đổi mật khẩu".tr,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
        onClick: () {
          resetPasswordController.resetPassword(
              resetPasswordController.newPasswordController.text,
              resetPasswordController.confirmPasswordController.text);
          Get.offNamed(AppRoutes.LOGIN);
        },
      ),
    );
  }

  _buildPasswordField(TextEditingController controller, String labelText,
      RxBool isObscurePassword) {
    return TextFormField(
      autofocus: false,
      controller: controller,
      obscureText: isObscurePassword.value,
      enableSuggestions: false,
      autocorrect: false,
      keyboardType: TextInputType.text,
      onSaved: (save) {
        controller.text = save!;
      },
      validator: (value) {
        return null;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: const Icon(Icons.vpn_key),
          suffixIcon: IconButton(
              onPressed: () {
                isObscurePassword.value = !isObscurePassword.value;
              },
              icon: isObscurePassword.isTrue
                  ? const Icon(Icons.visibility)
                  : const Icon(Icons.visibility_off)),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
  }
}
