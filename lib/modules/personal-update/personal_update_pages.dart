import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_app_doctor/components/auth_button.dart';
import 'package:healthcare_app_doctor/modules/personal-update/personal_update_controller.dart';
import 'package:healthcare_app_doctor/modules/personal/personal_controller.dart';
import 'package:intl/intl.dart';

enum Gender { MALE, FEMALE }

class PersonalUpdatePage extends StatelessWidget {
  final personalController = Get.find<PersonalController>();
  PersonalUpdatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Rx<Gender> _character = personalController.gender == "MALE"
        ? Gender.MALE.obs
        : Gender.FEMALE.obs;
    final personalUpdateController = Get.find<PersonalUpdateController>();
    DateTime _selectedDate = personalController.time ?? DateTime.now();

    Future<void> _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: _selectedDate,
          firstDate: DateTime(1990, 8),
          lastDate: DateTime(2101));
      if (picked != null && picked != _selectedDate) {
        // setState(() {
        _selectedDate = picked;
        personalController.dateController.text =
            DateFormat.yMd().format(_selectedDate);
        // });
      }
    }

    _buildDateField(TextEditingController controller, BuildContext context) {
      return TextFormField(
        autofocus: false,
        controller: controller,
        obscureText: false,
        enableSuggestions: false,
        autocorrect: false,
        onSaved: (save) {
          controller.text = save!;
        },
        validator: (value) {
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
        body: SingleChildScrollView(
          child: Container(
              // decoration: const BoxDecoration(
              //   color: Color.fromARGB(255, 125, 157, 223),
              // ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Text(
                  "Cập nhập thông tin".tr,
                  style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisSize: MainAxisSize.max,
                      children: [
                        Obx(() => _buildFullNameField(
                            personalController.fullNameController,
                            "Họ và tên",
                            personalController.isCancelFullName,
                            personalController.fullName.value)),
                        const SizedBox(
                          height: 20,
                        ),
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
                        const SizedBox(
                          height: 20,
                        ),
                        _buildDateField(
                            personalController.dateController, context),
                        const SizedBox(
                          height: 20,
                        ),
                        Obx(() => _buildFullNameField(
                            personalController.addressController,
                            "Địa chỉ",
                            personalController.isCancelAddress,
                            personalController.address)),
                        const SizedBox(
                          height: 20,
                        ),
                        Obx(() => _buildFullNameField(
                            personalController.workPlaceController,
                            "Nơi làm việc",
                            personalController.isCancelJob,
                            personalController.workPlace)),
                        const SizedBox(
                          height: 20,
                        ),
                        Obx(() => _buildFullNameField(
                            personalController.experienceController,
                            "Kinh nghiệm",
                            personalController.isCancelExperience,
                            personalController.experience)),
                        const SizedBox(
                          height: 20,
                        ),
                        Obx(() => _buildFullNameField(
                            personalController.descriptionController,
                            "Mô tả",
                            personalController.isCancelDescription,
                            personalController.description)),
                        const SizedBox(
                          height: 20,
                        ),
                        Obx(() => _buildFullNameField(
                            personalController.specializeController,
                            "Chuyên môn",
                            personalController.isCancelSpecialize,
                            personalController.specialize)),
                        const SizedBox(
                          height: 20,
                        ),
                        Obx(
                          () => AuthButton(
                            widget: personalController.isLoadingButton.isTrue
                                ? const Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  )
                                : Text(
                                    "Chỉnh sửa".tr,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                            onClick: () {

                              DateTime date = DateFormat("dd/MM/yyyy").parse(
                                  personalController.dateController.text);

                              personalUpdateController.updatePersonal(
                                  personalController.fullNameController.text,
                                  personalController.addressController.text,
                                  _character.value == Gender.MALE
                                      ? "MALE"
                                      : "FEMALE",
                                  _selectedDate,
                                  personalController.experienceController.text,
                                  personalController.specializeController.text,
                                  personalController.workPlaceController.text,
                                  personalController.descriptionController.text);
                             

                              // Get.toNamed(AppRoutes.PERSONAL_INFO_PAGE);
                            },
                          ),
                        ),
                      ]),
                )
              ])),
        ),
      ),
    );
  }

  _buildFullNameField(TextEditingController controller, String labelText,
      RxBool isCancel, String initialValue) {
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
      onChanged: (val) {
        if (controller.value.text != initialValue) {
          isCancel.value = false;
        } else {
          isCancel.value = true;
        }
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        labelText: labelText,
        suffixIcon: IconButton(
            onPressed: () {
              if (controller.value.isComposingRangeValid) {
                controller.text = initialValue;
                isCancel.value = true;
              }
            },
            icon: isCancel.isTrue
                ? const Icon(Icons.border_color)
                : const Icon(Icons.cancel_outlined)),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
