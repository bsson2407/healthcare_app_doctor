import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_app_doctor/modules/personal/personal_controller.dart';
import 'package:healthcare_app_doctor/routes/app_routes.dart';
import 'package:healthcare_app_doctor/utils/constant.dart';
import 'package:intl/intl.dart';

import '../../components/auth_button.dart';

class PersonalInfoPage extends StatelessWidget {
  PersonalInfoPage({Key? key}) : super(key: key);
  final personalController = Get.find<PersonalController>();

  @override
  Widget build(BuildContext context) {
    String gender = personalController.user?.gender == "MALE" ? "Nam" : "Nữ";
    DateTime? dateOfBirth = personalController.user?.dateOfBirth!;
    var inputFormat = DateFormat('dd/MM/yyyy').format(dateOfBirth!);
    print(
        "personalController.user?.fullName!__==${personalController.user?.fullName!}");
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            color: Colors.blue,
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
              // decoration: const BoxDecoration(
              //   color: Color.fromARGB(255, 125, 157, 223),
              // ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Container(
                  height: 100,
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                            'https://cdn1.vectorstock.com/i/1000x1000/31/95/user-sign-icon-person-symbol-human-avatar-vector-12693195.jpg'),
                        // radius: 24,
                      ),
                      Expanded(
                        child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: kDefaultPadding),
                            child: Text(
                              personalController.user?.fullName! ?? "",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w900),
                            )
                            // Text(
                            //   personalController.user?.fullName! ?? "",
                            //   style:
                            //       TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                            // ),
                            ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisSize: MainAxisSize.max,
                        children: [
                          const Text(
                            "Thông tin cá nhân",
                            style: TextStyle(fontSize: 20),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          _fieldInfo("Giới tính", gender),
                          const SizedBox(
                            height: 5,
                          ),
                          const Divider(
                            thickness: 1,
                            color: Colors.grey,
                            indent: 5,
                            endIndent: 5,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          _fieldInfo("Ngày sinh", inputFormat),
                          const SizedBox(
                            height: 5,
                          ),
                          const Divider(
                            thickness: 1,
                            color: Colors.grey,
                            indent: 5,
                            endIndent: 5,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          _fieldInfo("Địa chỉ",
                              personalController.user?.address! ?? ""),
                          const SizedBox(
                            height: 5,
                          ),
                          const Divider(
                            thickness: 1,
                            color: Colors.grey,
                            indent: 5,
                            endIndent: 5,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          _fieldInfo("Nơi làm việc",
                              personalController.user?.workPlace! ?? ""),
                          const SizedBox(
                            height: 5,
                          ),
                          const Divider(
                            thickness: 1,
                            color: Colors.grey,
                            indent: 5,
                            endIndent: 5,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          _fieldInfo("Kinh nghiệm",
                              personalController.user?.experience! ?? ""),
                          const SizedBox(
                            height: 5,
                          ),
                          const Divider(
                            thickness: 1,
                            color: Colors.grey,
                            indent: 5,
                            endIndent: 5,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          _fieldInfo("Chuyên môn",
                              personalController.user?.specialize! ?? ""),
                          const SizedBox(
                            height: 5,
                          ),
                          const Divider(
                            thickness: 1,
                            color: Colors.grey,
                            indent: 5,
                            endIndent: 5,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          _fieldInfo("Mô tả",
                              personalController.user?.description! ?? ""),
                          const SizedBox(
                            height: 30,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          // _buildUpdateButton(),
                          _buildUpdateButton()
                        ])),
              ])),
        ),
      ),
    );
  }

  _fieldInfo(String label, String value) {
    return Row(
      children: [
        Container(
          width: 150,
          child: Text(
            label,
            style: const TextStyle(fontSize: 16),
          ),
        ),
        Container(
          width: 220,
          child: Text(value,
              style: const TextStyle(fontSize: 16),
              softWrap: true,
              overflow: TextOverflow.visible,
              maxLines: 2),
        ),
      ],
    );
  }

  _buildUpdateButton() {
    return AuthButton(
      widget: Text(
        "Chỉnh sửa".tr,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      onClick: () {
        Get.offNamed(AppRoutes.PERSONAL_UPDATE_PAGE);
      },
    );
  }

  // _buildUpdateButton() {
  //   return Material(
  //     borderRadius: BorderRadius.circular(30),
  //     elevation: 8,
  //     color: Colors.white,
  //     child: MaterialButton(
  //       minWidth: 20,
  //       padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
  //       onPressed: () {},
  //       child: Text("Chỉnh sửa"),
  //     ),
  //   );
  // }
}
