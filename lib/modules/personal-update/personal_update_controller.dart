import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:healthcare_app_doctor/modules/personal/personal_controller.dart';
import 'package:healthcare_app_doctor/repository/user.repository.dart';
import 'package:healthcare_app_doctor/routes/app_routes.dart';

class PersonalUpdateController extends GetxController {
  final userRepository = Get.find<UserRepository>();
  final personalController = Get.find<PersonalController>();

  // var formKey = GlobalKey<FormState>();
  void updatePersonal(
      String fullName,
      String address,
      String gender,
      DateTime dateOfBirth,
      String experience,
      String specialize,
      String workPlace,
      String description) async {
    // if (formKey.currentState!.validate()) {
    try {
      final response = await userRepository.update(fullName, address, gender,
          dateOfBirth, experience, specialize, workPlace, description);

      if (response.statusCode == 200) {
        final response = await userRepository
            .getMe()
            .then((value) => personalController.getInforPersonal())
            .then((value) => Get.offNamed(AppRoutes.PERSONAL_INFO_PAGE));
      }
    } on DioError catch (e) {}
  }
}
