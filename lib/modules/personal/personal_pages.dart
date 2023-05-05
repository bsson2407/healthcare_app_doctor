// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_app_doctor/modules/personal/personal_controller.dart';
import 'package:healthcare_app_doctor/routes/app_routes.dart';
import 'package:healthcare_app_doctor/utils/constant.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';

// import 'package:url_launcher/url_launcher.dart';
final personalController = Get.find<PersonalController>();

class PersonalPage extends StatelessWidget {
  PersonalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            // color: Colors.grey[200],
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            height: 100,
            color: Colors.grey[200],
            child: Row(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(personalController.avatar),
                  // radius: 24,
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: Obx(() => Text(
                          personalController.fullName.value,
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w900),
                        )),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 50),
          GestureDetector(
            onTap: () {
              Get.toNamed(AppRoutes.PERSONAL_INFO_PAGE);
            },
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              height: 70,
              decoration: BoxDecoration(
                color: Colors.grey[200],
              ),
              child: Row(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.person),
                      const SizedBox(width: 10),
                      Text(
                        "Tài khoản",
                        style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                  const Spacer(),
                  const Icon(
                    CupertinoIcons.chevron_forward,
                    color: Colors.black,
                    size: 24,
                  )
                ],
              ),
            ),
          ),
          // const Divider(),
          GestureDetector(
            onTap: () {
              Get.toNamed(AppRoutes.CHANGE_PASSWORD_PAGE);
            },
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              height: 70,
              decoration: BoxDecoration(
                color: Colors.grey[200],
              ),
              child: Row(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.lock),
                      const SizedBox(width: 10),
                      Text(
                        "Đổi mật khẩu",
                        style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: 18,
                          // letterSpacing: 1,
                          // fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  const Spacer(),
                  const Icon(
                    CupertinoIcons.chevron_forward,
                    color: Colors.black,
                    size: 24,
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          // GestureDetector(
          //   onTap: () async {
          //     final phoneNumber = 'tel:115';
          //     if (await canLaunch(phoneNumber)) {
          //       await launch(phoneNumber);
          //     } else {
          //       throw 'Không thể gọi đến số điện thoại $phoneNumber';
          //     }
          //   },
          //   child: Container(
          //     padding:
          //         const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          //     height: 70,
          //     decoration: BoxDecoration(
          //       color: Colors.grey[200],
          //     ),
          //     child: Row(
          //       children: [
          //         Row(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             const Icon(
          //               Icons.emergency,
          //               color: Colors.red,
          //             ),
          //             const SizedBox(width: 10),
          //             Text(
          //               "Cấp cứu",
          //               style: GoogleFonts.montserrat(
          //                 color: Colors.red,
          //                 fontSize: 18,
          //                 // letterSpacing: 1,
          //                 // fontWeight: FontWeight.bold,
          //               ),
          //             )
          //           ],
          //         ),
          //         const Spacer(),
          //         const Icon(
          //           CupertinoIcons.chevron_forward,
          //           color: Colors.red,
          //           size: 24,
          //         )
          //       ],
          //     ),
          //   ),
          // ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              personalController.logout();
            },
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              height: 70,
              decoration: BoxDecoration(
                color: Colors.grey[200],
              ),
              child: Row(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.logout,
                        color: Colors.red,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "Đăng xuất",
                        style: GoogleFonts.montserrat(
                          color: Colors.red,
                          fontSize: 18,
                          // letterSpacing: 1,
                          // fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  const Spacer(),
                  const Icon(
                    CupertinoIcons.chevron_forward,
                    color: Colors.red,
                    size: 24,
                  )
                ],
              ),
            ),
          )
        ])),
      ),
    );
  }
}
