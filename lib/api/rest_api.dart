import 'package:dio/dio.dart';
import 'package:healthcare_app_doctor/models/appointment/appointment_get_response.dart';
import 'package:healthcare_app_doctor/models/chats/chat_response.dart';
import 'package:healthcare_app_doctor/models/chats/message_request.dart';
import 'package:healthcare_app_doctor/models/chats/message_response.dart';
import 'package:healthcare_app_doctor/models/login/login_request.dart';
import 'package:healthcare_app_doctor/models/login/login_response.dart';
import 'package:healthcare_app_doctor/models/notifications/notification_response.dart';
import 'package:healthcare_app_doctor/models/user/user_response.dart';
import 'package:healthcare_app_doctor/service/local_storage_service.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_api.g.dart';

@RestApi(baseUrl: "http://10.0.2.2:5000/v1/")
abstract class RestClient {
  factory RestClient(Dio dio, {String? baseUrl}) {
    dio.options = BaseOptions(receiveTimeout: 60000, connectTimeout: 60000);
    dio.options.headers['Authorization'] =
        "Bearer ${LocalStorageService.getAccessToken()}";

    return _RestClient(dio);
  }

  @POST('auth/user/login')
  Future<LoginResponse> loginUser(@Body() LoginRequest login);

  @GET('user/me')
  Future<UserResponse> getMe();

  // @POST('health-record')
  // Future<RecordDayResponse> postHealthRecord(@Body() HealthRecordRequest dto);

  // @GET('health-record-day')
  // Future<HealthRecordDayResponse> getHealthRecordDay();

  // @GET('get-appointment-patient')
  // Future<AppointmentResponse> getAppointmentPatient();

  @PUT('appointment/{id}/refuse')
  Future<AppointmentGetResponse> refuseAppointment(
    @Path("id") String id,
  );

  @PUT('appointment/{id}/approve')
  Future<AppointmentGetResponse> approveAppointment(
    @Path("id") String id,
  );

  // @GET('get-bmi')
  // Future<HealthRecordResponse> getBmi();

  // @GET('get-heartbeat')
  // Future<HealthRecordResponse> getHeartbeat();

  // @GET('get-blood-pressure')
  // Future<HealthRecordResponse> getBloodPressure();

  // @GET('get-glucose')
  // Future<HealthRecordResponse> getGlucose();

  // @GET('get-cholesterol')
  // Future<HealthRecordResponse> getCholesterol();

  // @GET('doctor/{id}')
  // Future<DoctorResponse> getDoctorById(@Path("id") String id);

  @GET('chat/{id}')
  Future<ChatResponse> getChat(@Path("id") String id,
      @Query("pageSize") int pageSize, @Query("page") int page);

  @POST('chat/{id}')
  Future<MessageResponse> postChat(
      @Path("id") String id, @Body() MessageRequest dto);

  // @GET('health-record-member')
  // Future<HealthRecordResponse> getHealthRecordAllDay();

  @GET('get-notifications')
  Future<NotificationResponse> getNotifications();

  // @POST('user/logout')
  // Future<void> logout();
}
