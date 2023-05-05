import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_app_doctor/repository/user.repository.dart';
import 'package:healthcare_app_doctor/service/auth_service.dart';

class PhonePassController extends GetxController {
  var phoneController = TextEditingController();
  var authService = Get.find<AuthService>();
  final userRepository = Get.find<UserRepository>();
  var formKey = GlobalKey<FormState>();
  // RxString fullName = "".obs;
  // var addressController = TextEditingController();
  // String address = "";
  // String avatar = "";
  // var workPlaceController = TextEditingController();
  // String workPlace = "";
  // var descriptionController = TextEditingController();
  // String description = "";
  // var specializeController = TextEditingController();
  // String specialize = "";
  // var experienceController = TextEditingController();
  // var dateController = TextEditingController();
  // String experience = "";
  // String gender = "";
  // DateTime? time;
  // var isCancelFullName = true.obs;
  // var isCancelAddress = true.obs;
  // var isCancelJob = true.obs;
  // var isCancelInsuranceNumber = true.obs;
  // var isCancelDescription = true.obs;
  // var isCancelSpecialize = true.obs;
  // var isCancelExperience = true.obs;
  var isLoadingButton = false.obs;

  // DoctorLoginResponse? user;

  void postOtp(String phone) async {
    try {
      authService.sendOtpPhoneNumber(phone);
    } catch (err) {}
  }
}
