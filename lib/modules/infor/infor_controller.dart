import 'package:get/get.dart';
import 'package:healthcare_app_doctor/models/health-record/health_record_response.dart';
import 'package:healthcare_app_doctor/models/user/patients_response.dart';
import 'package:healthcare_app_doctor/repository/health_record.repository.dart';
import 'package:healthcare_app_doctor/service/local_storage_service.dart';
// import 'package:healthcare_app_doctor/models/user/patients_response.dart';
// import 'package:healthcare_app_doctor/repository/user.repository.dart';

class InforController extends GetxController {
  DataPatientResponse? user;
  final healthRecordRepository = Get.find<HealthRecordRepository>();
  RxList<DataResponse> dataList = RxList<DataResponse>([]);
  @override
  void onInit() {
    super.onInit();

    user = Get.arguments; // nhận tham số user

    loadData(user?.id);
  }

  void loadData(String? id) async {
    // List<DataResponse> responseList = await initList(id);
    final response =
        await healthRecordRepository.getHealthRecordPatient(1, 20, id);
    if (response.statusCode == 200) {
      dataList.addAll(response.data);
    } else {
      // Xử lý khi response trả về rỗng hoặc null
    }
  }
}
