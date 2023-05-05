import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_app_doctor/models/user/user_response.dart';
import 'package:healthcare_app_doctor/repository/user.repository.dart';
import 'package:healthcare_app_doctor/routes/app_routes.dart';
import 'package:healthcare_app_doctor/service/local_storage_service.dart';
import 'package:intl/intl.dart';

class PersonalController extends GetxController {
  final userRepository = Get.find<UserRepository>();
  var fullNameController = TextEditingController();
  RxString fullName = "".obs;
  var addressController = TextEditingController();
  String address = "";
  String avatar = "";
  var workPlaceController = TextEditingController();
  String workPlace = "";
  var descriptionController = TextEditingController();
  String description = "";
  var specializeController = TextEditingController();
  String specialize = "";
  var experienceController = TextEditingController();
  var dateController = TextEditingController();
  String experience = "";
  String gender = "";
  DateTime? time;
  var isCancelFullName = true.obs;
  var isCancelAddress = true.obs;
  var isCancelJob = true.obs;
  var isCancelInsuranceNumber = true.obs;
  var isCancelDescription = true.obs;
  var isCancelSpecialize = true.obs;
  var isCancelExperience = true.obs;
  var isLoadingButton = false.obs;

  DoctorLoginResponse? user;
  @override
  void onInit() {
    getInforPersonal();
    super.onInit();
  }

  void logout() async {
    LocalStorageService.setAccessToken("");
    LocalStorageService.setId("");
    LocalStorageService.setConversationId("");
    LocalStorageService.setRefreshToken("");
    LocalStorageService.setPhone("");
    LocalStorageService.setPassword("");

    Get.offAllNamed(AppRoutes.LOGIN);
  }

  void getInforPersonal() async {
    try {
      final response = await userRepository.getMe();
      if (response.statusCode == 200) {
        user = response.data!.doctor!;

        fullNameController.text = user?.fullName! ?? "";

        LocalStorageService.setId(user?.id ?? "");

        fullName.value = user?.fullName! ?? "";
        addressController.text = user?.address! ?? "";
        address = user?.address! ?? "";
        workPlaceController.text = user?.workPlace! ?? "";
        workPlace = user?.workPlace! ?? "";
        descriptionController.text = user?.description ?? "";
        description = user?.description ?? "";
        specializeController.text = user?.specialize ?? "";
        specialize = user?.specialize ?? "";
        // medicalHistoryController.text = user?.medicalHistory! ?? "";
        // medicalHistory = user?.fullName! ?? "";
        gender = user?.gender! ?? "";
        time = user?.dateOfBirth!;
        var inputFormat = DateFormat('dd/MM/yyyy').format(time!);
        print("user?.avatar: ${user?.avatar}");

        dateController.text = inputFormat;
        avatar = user?.avatar! ??
            "https://cdn1.vectorstock.com/i/1000x1000/31/95/user-sign-icon-person-symbol-human-avatar-vector-12693195.jpg";
        print("avatar: $avatar");
      }
    } catch (err) {}
  }
}
