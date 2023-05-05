import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_app_doctor/components/auth_button.dart';
import 'package:healthcare_app_doctor/modules/login/login_controller.dart';
import 'package:healthcare_app_doctor/routes/app_routes.dart';

import 'package:nb_utils/nb_utils.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final loginController = Get.find<LoginController>();
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
          key: loginController.formKey,
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(36),
              width: Get.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Đăng nhập".tr,
                    style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildPhoneField(loginController.phoneController),
                  const SizedBox(height: 20),
                  Obx(
                    () =>
                        _buildPasswordField(loginController.passwordController),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.PHONE_PASS_PAGE);
                        },
                        child: Text(
                          "Quên mật khẩu".tr,
                          style: primaryTextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  _buildSignInButton(),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Chưa có tài khoản".tr,
                        style: primaryTextStyle(),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                          Get.toNamed(AppRoutes.SIGN_UP);
                        },
                        child: Text(
                          "Đăng ký".tr,
                          style: primaryTextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
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
        widget: loginController.isButtonLoading.isTrue
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : Text(
                "Đăng nhập".tr,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
        onClick: () {
          // Get.offNamed(AppRoutes.MAIN_NAVIGATION);
          String phone = loginController.phoneController.text;
          String password = loginController.passwordController.text;
          loginController.login(phone, password);
        },
      ),
    );
  }

  _buildPhoneField(TextEditingController controller) {
    return TextFormField(
      autofocus: false,
      controller: controller,
      obscureText: false,
      enableSuggestions: false,
      autocorrect: false,
      keyboardType: TextInputType.phone,
      onSaved: (save) {
        controller.text = save!;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return "Nhập số điện thoại".tr;
        }
        return null;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          hintText: "Số điện thoại",
          prefixIcon: const Icon(Icons.phone),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
  }

  _buildPasswordField(TextEditingController controller) {
    return TextFormField(
      autofocus: false,
      controller: controller,
      obscureText: loginController.isObscurePassword.value,
      enableSuggestions: false,
      autocorrect: false,
      keyboardType: TextInputType.text,
      onSaved: (save) {
        controller.text = save!;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return "Nhập mật khẩu".tr;
        } else if (!(RegExp("^(\\w{6,})\$").hasMatch(value))) {
          return "password_at_least".tr;
        }
        return null;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          hintText: "Mật khẩu".tr,
          prefixIcon: const Icon(Icons.vpn_key),
          suffixIcon: IconButton(
              onPressed: () {
                loginController.isObscurePassword.value =
                    !loginController.isObscurePassword.value;
              },
              icon: loginController.isObscurePassword.isTrue
                  ? const Icon(Icons.visibility)
                  : const Icon(Icons.visibility_off)),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
  }

  // _buildResetPassword() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.end,
  //     children: [
  //       GestureDetector(
  //         onTap: () async {
  //           await Get.defaultDialog(
  //             contentPadding: const EdgeInsets.all(8),
  //             title: "reset_password".tr,
  //             titleStyle: const TextStyle(color: Colors.blue, fontSize: 20),
  //             content: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text("please_enter_email".tr),
  //                 10.height,
  //                 Form(
  //                   key: loginController.formKeyDialog,
  //                   child: _buildEmailField(
  //                       loginController.emailResetPasswordController),
  //                 )
  //               ],
  //             ),
  //             confirm: Obx(
  //               () => InkWell(
  //                 onTap: () {
  //                   loginController.resetPassword(
  //                       loginController.emailResetPasswordController.text);
  //                 },
  //                 child: Container(
  //                   alignment: Alignment.center,
  //                   width: 200,
  //                   height: 40,
  //                   decoration: BoxDecoration(
  //                     color: Colors.blue,
  //                     borderRadius: BorderRadius.circular(8),
  //                     shape: BoxShape.rectangle,
  //                   ),
  //                   child: loginController.isButtonLoadingDialog.isTrue
  //                       ? const Center(
  //                           child:
  //                               CircularProgressIndicator(color: Colors.white),
  //                         )
  //                       : Text(
  //                           "reset_password".tr,
  //                           style: const TextStyle(
  //                               color: Colors.white,
  //                               fontWeight: FontWeight.bold,
  //                               fontSize: 16),
  //                         ),
  //                 ),
  //               ),
  //             ),
  //           );
  //         },
  //         child: Text(
  //           "forgot_password".tr,
  //           style: primaryTextStyle(color: Colors.blue),
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
