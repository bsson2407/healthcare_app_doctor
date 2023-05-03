import 'package:dio/dio.dart';
import 'package:healthcare_app_doctor/api/rest_api.dart';
import 'package:healthcare_app_doctor/models/health-record/health_record_response.dart';
import 'package:healthcare_app_doctor/service/local_storage_service.dart';

class HealthRecordRepository {
  final dio = Dio(); // Provide a dio instance
  // String domain = "http://10.0.2.2:5000/v1";
  String domain = "https://healthcarebe-production.up.railway.app/v1";

  Future<HealthRecordResponse> getHealthRecordPatient(
      int? page, int? pageSize, String? patientId) async {
    final queryParams = {
      'page': page ?? 1,
      'pageSize': pageSize ?? 20,
      'patientId': patientId
    };
    // if (status != null) {
    //   queryParams['status'] = status;
    // }
    dio.options = BaseOptions(receiveTimeout: 60000, connectTimeout: 60000);
    dio.options.headers['Authorization'] =
        "Bearer ${LocalStorageService.getAccessToken()}";

    final response = await dio.get(
      '$domain/doctor/health-record-patient',
      queryParameters: queryParams,
    );

    return HealthRecordResponse.fromJson(response.data);
  }
}
