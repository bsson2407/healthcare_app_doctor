import 'package:dio/dio.dart';
import 'package:healthcare_app_doctor/api/rest_api.dart';
import 'package:healthcare_app_doctor/models/login/login_request.dart';
import 'package:healthcare_app_doctor/models/login/login_response.dart';
import 'package:healthcare_app_doctor/models/user/patients_response.dart';
import 'package:healthcare_app_doctor/models/user/person_response.dart';
import 'package:healthcare_app_doctor/models/user/user_response.dart';
import 'package:healthcare_app_doctor/service/local_storage_service.dart';
import 'package:intl/intl.dart';

class UserRepository {
  final dio = Dio(); // Provide a dio instance
  String domain = "http://10.0.2.2:5000/v1";
  // String domain = "https://healthcarebe-production.up.railway.app/v1";
  Future<UserResponse> getMe() async {
    final client = RestClient(dio);
    return await client.getMe();
  }

  // Future<LoginResponse> loginUser(LoginRequest login) async {
  //   final client = RestClient(dio);
  //   return await client.loginUser(login);
  // }

  Future<LoginResponse> loginUser(LoginRequest login) async {
    // Dio dios = new Dio();
    print("loginphone: ${login.phone}");
    print("loginpassword: ${login.password}");
    print("loginpassword: $domain/auth/user/login");
    dio.options = BaseOptions(receiveTimeout: 60000, connectTimeout: 60000);

    // dio.options.headers['Authorization'] =
    //     "Bearer ${LocalStorageService.getAccessToken()}";
    final response = await dio.post('$domain/auth/user/login',
        data: {"phone": login.phone, "password": login.password});
    print("response: ${response}");

    return LoginResponse.fromJson(response.data);
  }

  Future<PersonResponse> getPerson(String id) async {
    dio.options = BaseOptions();
    dio.options.headers['Authorization'] =
        "Bearer ${LocalStorageService.getAccessToken()}";

    final response = await dio.get(
      '$domain/user/me/$id',
    );
    return PersonResponse.fromJson(response.data);
  }

  Future<PatientResponse> getPatients(
    int? page,
    String? search
  ) async {
    final queryParams = {
      'page': page ?? 1,
      'pageSize': "10",
    };
    // if (status != null) {
    //   queryParams['status'] = status;
    // }

    if(search != ""){
      queryParams['search'] = search as String;
    }
    dio.options = BaseOptions(receiveTimeout: 60000, connectTimeout: 60000);
    dio.options.headers['Authorization'] =
        "Bearer ${LocalStorageService.getAccessToken()}";

    final response = await dio.get(
      '$domain/doctor/patients',
      queryParameters: queryParams,
    );

    return PatientResponse.fromJson(response.data);
  }

  Future<Response> changePassword(
    String? oldPassword,
    String? newPassword,
    String? confirmNewPassword,
  ) async {
    // if (status != null) {
    //   queryParams['status'] = status;
    // }
    dio.options = BaseOptions();
    dio.options.headers['Authorization'] =
        "Bearer ${LocalStorageService.getAccessToken()}";

    final response = await dio.patch('$domain/user/change-password', data: {
      "oldPassword": oldPassword,
      "newPassword": newPassword,
      "confirmNewPassword": confirmNewPassword,
    });

    return response;
  }

  Future<Response> resetPassword(
    String? phone,
    String? newPassword,
    String? confirmNewPassword,
  ) async {
    // if (status != null) {
    //   queryParams['status'] = status;
    // }
    dio.options = BaseOptions();
    dio.options.headers['Authorization'] =
        "Bearer ${LocalStorageService.getAccessToken()}";

    final response = await dio.patch('$domain/user/update-password', data: {
      "phone": phone,
      "newPassword": newPassword,
      "confirmNewPassword": confirmNewPassword,
    });

    return response;
  }

  Future<UserResponse> update(
      String fullName,
      String address,
      String gender,
      DateTime dateOfBirth,
      String experience,
      String specialize,
      String workPlace,
      String description) async {
    dio.options = BaseOptions();
    dio.options.headers['Authorization'] =
        "Bearer ${LocalStorageService.getAccessToken()}";
    String formattedDate = DateFormat("yyyy-MM-dd").format(dateOfBirth);
    final response = await dio.patch('$domain/doctor', data: {
      "fullName": fullName,
      "address": address,
      "gender": gender,
      "dateOfBirth": formattedDate,
      "experience": experience,
      "specialize": specialize,
      "workPlace": workPlace,
      "description": description,
    });

    return UserResponse.fromJson(response.data);
  }
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
