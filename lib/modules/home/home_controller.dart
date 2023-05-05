import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_app_doctor/models/user/patients_response.dart';
import 'package:healthcare_app_doctor/repository/user.repository.dart';

class HomeController extends GetxController {
  final userRepository = Get.find<UserRepository>();
  RxList<DataPatientResponse> lstPatients = RxList<DataPatientResponse>([]);
  RxInt page = 1.obs;
  var searchController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  @override
  void onInit() {
    super.onInit();
    initList("");
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() async {
    print(
        "---scrollController.position.pixels--${scrollController.position.pixels}");
    print(
        "---scrollController.position.maxScrollExtent--${scrollController.position.maxScrollExtent}");
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      print("---.page.value.--${page.value++}");
      final response =
          await userRepository.getPatients(page.value++, searchController.text);
      if (response.statusCode == 200) {
        // listBmi = response.data;

        lstPatients.addAll(response.data);
      } else {
        // Xử lý khi API trả về lỗi
      }
    }
  }

  void initList(String search) async {
    final response = await userRepository.getPatients(page.value, search);
    if (response.statusCode == 200) {
      // listBmi = response.data;
      lstPatients.clear();
      lstPatients.addAll(response.data);
    } else {
      // Xử lý khi API trả về lỗi
    }
  }
}
