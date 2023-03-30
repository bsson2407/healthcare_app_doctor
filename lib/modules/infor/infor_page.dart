import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthcare_app_doctor/models/user/patients_response.dart';
import 'package:healthcare_app_doctor/modules/infor/infor_controller.dart';
import 'package:healthcare_app_doctor/modules/infor/infor_profile.dart';
import 'package:healthcare_app_doctor/modules/infor/infor_table.dart';
import 'package:healthcare_app_doctor/routes/app_routes.dart';
import 'package:healthcare_app_doctor/widgets/tabbar_widget.dart';
import 'package:nb_utils/nb_utils.dart';

class InforPage extends StatelessWidget {
  var inforController = Get.find<InforController>();

  @override
  Widget build(BuildContext context) => TabBarWidget(
        title: 'Thông tin bệnh nhân',
        tabs: const [
          Tab(icon: Icon(Icons.table_chart), text: 'Thông tin'),
          Tab(icon: Icon(Icons.table_chart), text: 'Bảng'),
          Tab(icon: Icon(Icons.bar_chart), text: 'Biểu đồ'),
        ],
        children: [
          ProfilePage(),
          InforTable(),
          SafeArea(
            child: ListView(padding: const EdgeInsets.all(16), children: [
              const SizedBox(
                height: 16.0,
              ),
              _buildFieldSelect(
                'BMI',
                Colors.grey[400]!,
                () {
                  Get.toNamed(AppRoutes.BMI_PAGE);
                },
              ),
              const SizedBox(
                height: 16.0,
              ),
              _buildFieldSelect(
                'Huyết áp',
                Colors.yellow[200]!,
                () {
                  Get.toNamed(AppRoutes.BLOOD_PRESSURE_PAGE);
                },
              ),
              const SizedBox(
                height: 16.0,
              ),
              _buildFieldSelect(
                'Nhịp tim',
                Colors.green[100]!,
                () {
                  Get.toNamed(AppRoutes.HEARTBEAT_PAGE);
                },
              ),
              const SizedBox(
                height: 16.0,
              ),
              _buildFieldSelect(
                'Glucose',
                Colors.blue[100]!,
                () {
                  Get.toNamed(AppRoutes.GLUCOSE_PAGE);
                },
              ),
              const SizedBox(
                height: 16.0,
              ),
              _buildFieldSelect(
                'Cholesterol',
                Colors.orange[200]!,
                () {
                  Get.toNamed(AppRoutes.CHOLESTEROL_PAGE);
                },
              )
            ]),
          ),
        ],
      );

  _buildFieldSelect(text, color, VoidCallback press) {
    return InkWell(
      onTap: press,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        height: 90,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.2,
          ),
          color: color,
          borderRadius: const BorderRadius.all(
            Radius.circular(16.0),
          ),
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: GoogleFonts.montserrat(
                    color: black,
                    fontSize: 18,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            const Spacer(),
            const Icon(
              CupertinoIcons.chevron_forward,
              color: black,
              size: 24,
            )
          ],
        ),
      ),
    );
  }
}
