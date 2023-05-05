import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_app_doctor/components/auth_button.dart';
import 'package:healthcare_app_doctor/modules/login/login_controller.dart';
import 'package:healthcare_app_doctor/modules/phone_pass/phone_pass_controller.dart';
import 'package:healthcare_app_doctor/routes/app_routes.dart';
import 'package:nb_utils/nb_utils.dart';

class PhonePassPage extends StatelessWidget {
  PhonePassPage({Key? key}) : super(key: key);
  final phonePassController = Get.find<PhonePassController>();
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
          key: phonePassController.formKey,
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(36),
              width: Get.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Quên mật khẩu".tr,
                    style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildPhoneField(phonePassController.phoneController),
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
        widget: phonePassController.isLoadingButton.isTrue
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : Text(
                "Xác thực".tr,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
        onClick: () {
          // Get.offNamed(AppRoutes.MAIN_NAVIGATION);

          phonePassController.postOtp(phonePassController.phoneController.text);
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
}
