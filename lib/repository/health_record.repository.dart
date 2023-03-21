import 'package:dio/dio.dart';
import 'package:healthcare_app_doctor/api/rest_api.dart';
import 'package:healthcare_app_doctor/models/health-record/health_record_response.dart';
import 'package:healthcare_app_doctor/service/local_storage_service.dart';

class HealthRecordRepository {
  final dio = Dio(); // Provide a dio instance

  // Future<RecordDayResponse> postHealthRecord(
  //     HealthRecordRequest dto) async {
  //   final client = RestClient(dio);
  //   return await client.postHealthRecord(dto);
  // }

  // Future<HealthRecordDayResponse> getHealthRecordDay() async {
  //   final client = RestClient(dio);
  //   return await client.getHealthRecordDay();
  // }

  // Future<HealthRecordResponse> getBmi() async {
  //   final client = RestClient(dio);
  //   return await client.getBmi();
  // }

  // Future<HealthRecordResponse> getBloodPressure() async {
  //   final client = RestClient(dio);
  //   return await client.getBloodPressure();
  // }

  // Future<HealthRecordResponse> getCholesterol() async {
  //   final client = RestClient(dio);
  //   return await client.getCholesterol();
  // }

  // Future<HealthRecordResponse> getHeartbeat() async {
  //   final client = RestClient(dio);
  //   return await client.getHeartbeat();
  // }

  // Future<HealthRecordResponse> getGlucose() async {
  //   final client = RestClient(dio);
  //   return await client.getGlucose();
  // }

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
      'http://10.0.2.2:5000/v1/doctor/health-record-patient',
      queryParameters: queryParams,
    );

    return HealthRecordResponse.fromJson(response.data);
  }
}
