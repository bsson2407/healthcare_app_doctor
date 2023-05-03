import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_app_doctor/components/auth_button.dart';
import 'package:healthcare_app_doctor/modules/sign_up/sign_up_controller.dart';
import 'package:healthcare_app_doctor/routes/app_routes.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';

enum Gender { MALE, FEMALE }

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);
  final signUpController = Get.find<SignUpController>();
  DateTime _selectedDate = DateTime.now();
  Rx<Gender> _character = Gender.MALE.obs;
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
                    "Đăng ký bác sĩ".tr,
                    style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildFullNameField(signUpController.fullNameController),
                  const SizedBox(height: 20),
                  Obx(
                    () => Row(
                      children: <Widget>[
                        const Text(
                          'Giới tính:',
                          style: TextStyle(fontSize: 16),
                        ),
                        Container(
                          width: 140,
                          child: ListTile(
                            title: const Text('Nam'),
                            leading: Radio<Gender>(
                              value: Gender.MALE,
                              groupValue: _character.value,
                              onChanged: (Gender? value) {
                                _character.value = value!;
                              },
                            ),
                          ),
                        ),
                        Container(
                          width: 120,
                          child: ListTile(
                            title: const Text('Nữ'),
                            leading: Radio<Gender>(
                              value: Gender.FEMALE,
                              groupValue: _character.value,
                              onChanged: (Gender? value) {
                                _character.value = value!;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  _buildPhoneField(signUpController.phoneController),
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
                  const SizedBox(height: 20),
                  _buildDateField(
                      signUpController.dateOfBirthController, context),
                  const SizedBox(height: 20),
                  _buildEmailField(signUpController.emailController),
                  const SizedBox(height: 20),
                  _buildExperienceField(signUpController.experienceController),
                  const SizedBox(height: 20),
                  _buildWorkPlaceField(signUpController.workPlaceController),
                  const SizedBox(height: 20),
                  _buildSpecializeField(signUpController.specializeController),
                  const SizedBox(height: 20),
                  _buildDescriptionField(
                      signUpController.descriptionController),
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
                              "Đăng ký".tr,
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
                        "Đã có tài khoản ".tr,
                        style: primaryTextStyle(),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                          Get.toNamed(AppRoutes.LOGIN);
                        },
                        child: Text(
                          "Đăng nhập".tr,
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

  _buildEmailField(TextEditingController controller) {
    return TextFormField(
      autofocus: false,
      controller: controller,
      obscureText: false,
      enableSuggestions: false,
      autocorrect: false,
      keyboardType: TextInputType.emailAddress,
      onSaved: (save) {
        controller.text = save!;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return "Không được bỏ trống".tr;
        } else if (!(EmailValidator.validate(value))) {
          return "Email không phù hợp".tr;
        }
        return null;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          hintText: "Email",
          prefixIcon: const Icon(Icons.email_outlined),
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
        labelText: "Mật khẩu",
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
          return "Không đươc để trôngg1".tr;
        } else if (!(RegExp("^(\\w{6,})\$").hasMatch(value))) {
          return "Mật khẩu có ít nhất 6 ký tự".tr;
        } else if (!(signUpController.passwordController.text ==
            signUpController.confirmPasswordController.text)) {
          return "Mật khẩu không khớp".tr;
        }
        return null;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        hintText: "Nhập lại mật khẩu".tr,
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

  Widget _buildFullNameField(TextEditingController controller) {
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
        hintText: "Họ và tên".tr,
        prefixIcon: const Icon(Icons.border_color),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
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
          return "Chưa nhập số điện thoại";
        }
        return null;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        labelText: "Số điện thoại".tr,
        prefixIcon: const Icon(Icons.phone_android),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  _buildDateField(TextEditingController controller, BuildContext context) {
    return TextFormField(
      autofocus: false,
      controller: controller,
      obscureText: false,
      enableSuggestions: false,
      autocorrect: false,
      keyboardType: TextInputType.datetime,
      onSaved: (save) {
        controller.text = save!;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return "please_enter_email".tr;
        } else if (!(EmailValidator.validate(value))) {
          return "email_invalid".tr;
        }
        return null;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          labelText: 'Ngày sinh',
          prefixIcon: const Icon(Icons.calendar_today),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
      onTap: () => {
        _selectDate(context),
      },
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900, 8),
        lastDate: DateTime(2050));
    if (picked != null && picked != _selectedDate) {
      // setState(() {
      _selectedDate = picked;
      signUpController.dateOfBirthController.text =
          DateFormat.yMd().format(_selectedDate);
      // });
    }
  }

  Widget _buildExperienceField(TextEditingController controller) {
    return TextFormField(
      autofocus: false,
      controller: controller,
      obscureText: false,
      enableSuggestions: false,
      autocorrect: false,
      keyboardType: TextInputType.number,
      onSaved: (save) {
        controller.text = save!;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return "Chưa nhập thông tin".tr;
        }
        return null;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        labelText: "Kinh nghiệm".tr,
        prefixIcon: const Icon(Icons.border_color),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget _buildWorkPlaceField(TextEditingController controller) {
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
          return "Chưa nhập thông tin".tr;
        }
        return null;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        labelText: "Nơi làm việc".tr,
        prefixIcon: const Icon(Icons.border_color),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget _buildSpecializeField(TextEditingController controller) {
    return TextField(
      autofocus: false,
      controller: controller,
      obscureText: false,
      enableSuggestions: false,
      autocorrect: false,
      keyboardType: TextInputType.multiline,
      maxLines: 3,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        labelText: "Chuyên môn".tr,
        prefixIcon: const Icon(Icons.border_color),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget _buildDescriptionField(TextEditingController controller) {
    return TextField(
      autofocus: false,
      controller: controller,
      obscureText: false,
      enableSuggestions: false,
      autocorrect: false,
      keyboardType: TextInputType.multiline,
      maxLines: 4,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        labelText: "Mô tả".tr,
        // prefixIcon: const Icon(Icons.border_color),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
