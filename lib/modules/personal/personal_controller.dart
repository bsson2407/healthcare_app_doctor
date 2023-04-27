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
  var isLoadingButton = false.obs;

  DoctorLoginResponse? user;
  @override
  void onInit() {
    super.onInit();
    getMe();
  }

  void getMe() async {
    try {
      final response = await userRepository.getMe();
       if (response.statusCode == 200) {
      user = response.data!.doctor!;
      print("object___${user?.avatar}");
      avatar = user?.avatar! ?? "";
      fullNameController.text = user?.fullName! ?? "";
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
      dateController.text = inputFormat;
    }
    } catch (err) {}
  }

  void logout() async {
    // final client = RestClient(dio);

    // try {
    //   await userRepository.logout().then((value) {
    LocalStorageService.setAccessToken("");

    Get.offAllNamed(AppRoutes.LOGIN);
    //   });
    // } on DioError catch (e) {
    //   EasyLoading.showError(e.response?.data['message']);
    // }
  }
}
