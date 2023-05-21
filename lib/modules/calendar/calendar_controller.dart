import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:healthcare_app_doctor/models/appointment/appointment_response.dart';
import 'package:healthcare_app_doctor/repository/appointment.repository.dart';
import 'package:dio/dio.dart';

class CalendarController extends GetxController {
  final appointmentRepository = Get.find<AppointmentRepository>();
  RxList<DataResponse> listAppointment = RxList<DataResponse>([]);

  void initListAppointment(String? status, DateTime? dateTime) async {
    final response = await appointmentRepository.getAppointmentDoctor(
        1, 10, status, dateTime);
    if (response.statusCode == 200) {
      // listBmi = response.data;
      listAppointment.clear();
      listAppointment.addAll(response.data);
    } else {
      // Xử lý khi API trả về lỗi
    }
  }

   Future<void> refreshListAppointment() async {
    // Thực hiện công việc làm mới, ví dụ: gọi lại API hoặc thực hiện tác vụ khác

    // Đợi một khoảng thời gian giả lập (ví dụ: 2 giây) để tải lại dữ liệu
    await Future.delayed(Duration(seconds: 2));

    // Đánh dấu làm mới hoàn thành bằng cách gọi phương thức refreshCompleted()
    // refreshCompleted();

    // Thực hiện các công việc cần thiết để làm mới dữ liệu
    initListAppointment("CREATED", null);
  }

  void refuseAppointment(String id) async {
    try {
      await appointmentRepository.refuseAppointment(id).then((value) {});
      initListAppointment("CREATED", null);
    } on DioError catch (e) {
      EasyLoading.showError(e.response?.data['message']);
    }
  }

  void approveAppointment(String id) async {
    try {
      await appointmentRepository.approveAppointment(id).then((value) {});
      initListAppointment("CREATED", null);
    } on DioError catch (e) {
      EasyLoading.showError(e.response?.data['message']);
    }
  }
}
