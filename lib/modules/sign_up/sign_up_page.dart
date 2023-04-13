import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:healthcare_app_doctor/components/auth_button.dart';
import 'package:healthcare_app_doctor/modules/sign_up/sign_up_controller.dart';
import 'package:healthcare_app_doctor/routes/app_routes.dart';

import 'package:lottie/lottie.dart';
import 'package:nb_utils/nb_utils.dart';


class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);
  final signUpController = Get.find<SignUpController>();
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
          key: signUpController.formKey,
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(36),
              width: Get.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "register_account".tr,
                    style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 200),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: Get.width / 2.8,
                        child: _buildFirstNameField(
                            signUpController.firstNameController),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        width: Get.width / 2.8,
                        child: _buildLastNameField(
                            signUpController.lastNameController),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // _buildEmailField(signUpController.emailController),
                  const SizedBox(height: 20),
                  Obx(
                    () => _buildPasswordField(
                        signUpController.passwordController),
                  ),
                  const SizedBox(height: 20),
                  Obx(
                    () => _buildConfirmPasswordField(
                        signUpController.confirmPasswordController),
                  ),
                  const SizedBox(height: 40),
                  Obx(
                    () => AuthButton(
                      widget: signUpController.isLoadingButton.isTrue
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : Text(
                              "sign_up".tr,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                      onClick: () {
                        String email = signUpController.emailController.text;
                        String password =
                            signUpController.passwordController.text;
                        signUpController.signUp(email, password);
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "already_account".tr,
                        style: primaryTextStyle(),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                          Get.toNamed(AppRoutes.LOGIN);
                        },
                        child: Text(
                          "sign_in".tr,
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

  // _buildEmailField(TextEditingController controller) {
  //   return TextFormField(
  //     autofocus: false,
  //     controller: controller,
  //     obscureText: false,
  //     enableSuggestions: false,
  //     autocorrect: false,
  //     keyboardType: TextInputType.emailAddress,
  //     onSaved: (save) {
  //       controller.text = save!;
  //     },
  //     validator: (value) {
  //       if (value!.isEmpty) {
  //         return "please_enter_email".tr;
  //       } else if (!(EmailValidator.validate(value))) {
  //         return "email_invalid".tr;
  //       }
  //       return null;
  //     },
  //     textInputAction: TextInputAction.done,
  //     decoration: InputDecoration(
  //         hintText: "Email",
  //         prefixIcon: const Icon(Icons.email_outlined),
  //         contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
  //         border: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(10),
  //         )),
  //   );
  // }

  _buildPasswordField(TextEditingController controller) {
    return TextFormField(
      autofocus: false,
      controller: controller,
      obscureText: signUpController.isObscurePassword.value,
      enableSuggestions: false,
      autocorrect: false,
      keyboardType: TextInputType.emailAddress,
      onSaved: (save) {
        controller.text = save!;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return "please_enter_password".tr;
        } else if (!(RegExp("^(\\w{6,})\$").hasMatch(value))) {
          return "password_at_least".tr;
        }
        return null;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        labelText: "Password",
      
        prefixIcon: const Icon(Icons.vpn_key),
        suffixIcon: IconButton(
            onPressed: () {
              signUpController.isObscurePassword.value =
                  !signUpController.isObscurePassword.value;
            },
            icon: signUpController.isObscurePassword.isTrue
                ? const Icon(Icons.visibility)
                : const Icon(Icons.visibility_off)),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  _buildConfirmPasswordField(TextEditingController controller) {
    return TextFormField(
      autofocus: false,
      controller: controller,
      obscureText: signUpController.isObscureConfirmPassword.value,
      enableSuggestions: false,
      autocorrect: false,
      keyboardType: TextInputType.emailAddress,
      onSaved: (save) {
        controller.text = save!;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return "please_re-enter_password".tr;
        } else if (!(RegExp("^(\\w{6,})\$").hasMatch(value))) {
          return "password_at_least".tr;
        } else if (!(signUpController.passwordController.text ==
            signUpController.confirmPasswordController.text)) {
          return "password_incorrect".tr;
        }
        return null;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        hintText: "re-enter_password".tr,
        prefixIcon: const Icon(Icons.vpn_key),
        suffixIcon: IconButton(
            onPressed: () {
              signUpController.isObscureConfirmPassword.value =
                  !signUpController.isObscureConfirmPassword.value;
            },
            icon: signUpController.isObscureConfirmPassword.isTrue
                ? const Icon(Icons.visibility)
                : const Icon(Icons.visibility_off)),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget _buildFirstNameField(TextEditingController controller) {
    return TextFormField(
      autofocus: false,
      controller: controller,
      obscureText: false,
      enableSuggestions: false,
      autocorrect: false,
      keyboardType: TextInputType.name,
      onSaved: (save) {
        controller.text = save!;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return "please_enter_first_name".tr;
        }
        return null;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        hintText: "first_name".tr,
        prefixIcon: const Icon(Icons.border_color),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  _buildLastNameField(TextEditingController controller) {
    return TextFormField(
      autofocus: false,
      controller: controller,
      obscureText: false,
      enableSuggestions: false,
      autocorrect: false,
      keyboardType: TextInputType.name,
      onSaved: (save) {
        controller.text = save!;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return "please_enter_last_name".tr;
        }
        return null;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        hintText: "last_name".tr,
        prefixIcon: const Icon(Icons.border_color),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
