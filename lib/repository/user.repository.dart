import 'package:dio/dio.dart';
import 'package:healthcare_app_doctor/api/rest_api.dart';
import 'package:healthcare_app_doctor/models/login/login_request.dart';
import 'package:healthcare_app_doctor/models/login/login_response.dart';
import 'package:healthcare_app_doctor/models/user/patients_response.dart';
import 'package:healthcare_app_doctor/models/user/user_response.dart';
import 'package:healthcare_app_doctor/service/local_storage_service.dart';


class UserRepository {
  final dio = Dio(); // Provide a dio instance

  Future<UserResponse> getMe() async {
    final client = RestClient(dio);
    return await client.getMe();
  }

  Future<LoginResponse> loginUser(LoginRequest login) async {
    final client = RestClient(dio);
    return await client.loginUser(login);
  }

Future<PatientResponse> getPatients(
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
      'http://10.0.2.2:5000/v1/doctor/patients',
      queryParameters: queryParams,
    );

    return PatientResponse.fromJson(response.data);
  }
  // Future<DoctorResponse> getDoctorById(String id) async {
  //   final client = RestClient(dio);
  //   return await client.getDoctorById(id);
  // }

  // Future<void> logout() async {
  //   final client = RestClient(dio);
  //   return await client.logout();
  // }

  // Future<List<UserResponse>> searchUserInWorkspace(
  //     String keyword, int workspace, int boardId) async {
  //   final client = RestClient(dio);
  //   return await client.searchUserInWorkspace(keyword, workspace, boardId);
  // }

  // Future<UserResponse> updateUser(String uid, UserRequest userRequest) async {
  //   final client = RestClient(dio);
  //   return await client.updateUser(uid, userRequest);
  // }
}
