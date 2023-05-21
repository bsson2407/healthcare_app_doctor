import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_app_doctor/models/user/patients_response.dart';
import 'package:healthcare_app_doctor/modules/infor/infor_controller.dart';

class ProfilePage extends StatelessWidget {

    final inforController = Get.find<InforController>();


  // void setUserData(DataPatientResponse user) {
  //   setState(() {
  //     user = user;
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    inforController.user?.avatar ??"https://thumbs.dreamstime.com/b/male-avatar-icon-flat-style-male-user-icon-cartoon-man-avatar-hipster-vector-stock-91462914.jpg",
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(inforController.user?.fullName ?? "",
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold)),
                const SizedBox(width: 6),
                // Text(lName,
                //     style: const TextStyle(
                //         fontSize: 22, fontWeight: FontWeight.bold)),
              ]),
              const SizedBox(height: 6),
              // Center(
              //   child: Text(
              //     email,
              //     style: TextStyle(color: Colors.grey.shade800),
              //   ),
              // ),
              const SizedBox(height: 15),
    
              const Divider(
                thickness: 2,
              ),
              const SizedBox(height: 10),
              // Row(
              //   children: [
              //     const Text('_Username: ',
              //         style:
              //             TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              //     Text(_userName.toString(),
              //         style: const TextStyle(
              //             fontSize: 18, fontWeight: FontWeight.w400)),
              //   ],
              // ),
              // const SizedBox(height: 25),
              // Row(children: [
              //   const Text('Age: ',
              //       style:
              //           TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              //   Text(dob.toString(),
              //       style: const TextStyle(
              //           fontSize: 18, fontWeight: FontWeight.w400))
              // ]),
              const SizedBox(height: 25),
              Row(children: [
                const Text('Giới tính: ',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text(
                    inforController.user?.gender != null
                        ? inforController.user?.gender == 'MALE'
                            ? "Nam"
                            : "Nữ"
                        : "",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w400))
              ]),
              const SizedBox(height: 25),
              Row(children: [
                const Text('Số điện thoại: ',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text(inforController.user?.phone.toString() ?? "",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w400))
              ]),
              const SizedBox(height: 25),
              Row(children: [
                const Text('Địa chỉ: ',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text(inforController.user?.address ?? "",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w400))
              ]),
              const SizedBox(height: 25),
              Row(children: [
                const Text('Công việc: ',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text(inforController.user?.job ?? "",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w400))
              ]),
              const SizedBox(height: 25),
              Row(children: [
                const Text('Số bảo hiểm: ',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text(inforController.user?.insuranceNumber ?? "",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w400))
              ]),
              const SizedBox(height: 25),
              Row(children: [
                const Text('Lịch sử bệnh: ',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text(inforController.user?.medicalHistory ?? "",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w400))
              ]),
              const SizedBox(height: 25),
              Row(children: [
                const Text('Trạng thái: ',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text(inforController.user?.state ?? "",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w400))
              ]),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
