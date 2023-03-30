import 'package:get/get.dart';
import 'package:healthcare_app_doctor/models/user/patients_response.dart';
import 'package:healthcare_app_doctor/repository/user.repository.dart';

class HomeController extends GetxController {
  final userRepository = Get.find<UserRepository>();
  RxList<DataPatientResponse> lstPatients = RxList<DataPatientResponse>([]);

  @override
  void onInit() {
    super.onInit();
    initList();
  }

  void initList() async {
    final response = await userRepository.getPatients(1, 20);
    if (response.statusCode == 200) {
      // listBmi = response.data;
      lstPatients.clear();
      lstPatients.addAll(response.data);
    } else {
      // Xử lý khi API trả về lỗi
    }
  }
}
