import 'package:dio/dio.dart';
import 'package:healthcare_app_doctor/api/rest_api.dart';
import 'package:healthcare_app_doctor/models/appointment/appointment_get_response.dart';
import 'package:healthcare_app_doctor/models/appointment/appointment_response.dart';
import 'package:healthcare_app_doctor/models/notifications/notification_response.dart';
import 'package:healthcare_app_doctor/service/local_storage_service.dart';

class AppointmentRepository {
  final dio = Dio(); // Provide a dio instance

  // Future<void> postHealthRecord(
  //     HealthRecordRequest dto) async {
  //   final client = RestClient(dio);
  //   return await client.postHealthRecord(dto);
  // }

  // Future<AppointmentResponse> getAppointmentPatient(
  //     int? page, int? pageSize, String? status) async {
  Future<AppointmentResponse> getAppointmentDoctor(
    int? page,
    int? pageSize,
    String? status,
    DateTime? dateTime,
  ) async {
    final queryParams = {
      'page': page ?? 1,
      'pageSize': pageSize ?? 10,
      if (status != null && status != '') 'status': status,
    };
    if (status != null) {
      queryParams['status'] = status;
    }
    if (dateTime != null) {
      queryParams['timeDate'] = dateTime;
    }
    dio.options = BaseOptions(receiveTimeout: 60000, connectTimeout: 60000);
    dio.options.headers['Authorization'] =
        "Bearer ${LocalStorageService.getAccessToken()}";

    final response = await dio.get(
      'http://10.0.2.2:5000/v1/get-appointment-doctor',
      queryParameters: queryParams,
    );

    return AppointmentResponse.fromJson(response.data);
  }
  // return await client.getAppointmentPatient();
  // }

  Future<NotificationResponse> getNotification(
    int? page,
    int? pageSize,
  ) async {
    final queryParams = {
      'page': page ?? 1,
      'pageSize': pageSize ?? 20,
    };
    // if (status != null) {
    //   queryParams['status'] = status;
    // }
    dio.options = BaseOptions(receiveTimeout: 60000, connectTimeout: 60000);
    dio.options.headers['Authorization'] =
        "Bearer ${LocalStorageService.getAccessToken()}";

    final response = await dio.get(
      'http://10.0.2.2:5000/v1/get-notifications',
      queryParameters: queryParams,
    );

    return NotificationResponse.fromJson(response.data);
  }

  // Future<AppointmentGetResponse> postAppointment(AppointmentRequest dto) async {
  //   final client = RestClient(dio);
  //   return await client.postAppointment(dto);
  // }

  Future<AppointmentGetResponse> refuseAppointment(String id) async {
    final client = RestClient(dio);
    return await client.refuseAppointment(id);
  }

  Future<AppointmentGetResponse> approveAppointment(String id) async {
    final client = RestClient(dio);
    return await client.approveAppointment(id);
  }
}
