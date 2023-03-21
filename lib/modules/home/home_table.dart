// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:healthcare_mobile/models/health-record/health_record_response.dart';
// import 'package:healthcare_mobile/modules/home/home_controller.dart';
// import 'package:healthcare_mobile/routes/app_routes.dart';
// import 'package:healthcare_mobile/widgets/sortable_page.dart';
// import 'package:intl/intl.dart';
// import 'package:healthcare_mobile/widgets/my_button.dart';

// class HomeTable extends StatelessWidget {
//   final homeController = Get.find<HomeController>();
//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       return Scaffold(
//         body: ScrollableWidget(
//             child: buildDataTable(homeController.list.cast<DataResponse>())),
//         floatingActionButton: Padding(
//           padding: const EdgeInsets.only(left: 40, right: 10),
//           child: MyButton(
//               disableButton: false,
//               bgColor: Color(0xFF5856d6),
//               title: "Báo cáo sức khỏe",
//               onTap: () {
//                 Get.toNamed(AppRoutes.HEALTH_RECORD_PAGE);
//               }),
//         ),
//       );
//     });
//   }

//   Widget buildDataTable(List<DataResponse> data) {
//     final columns = [
//       'Ngày',
//       'Chiều cao',
//       'Cân nặng',
//       'Chỉ số BMI',
//       'Tâm thu',
//       'Tâm trương',
//       'Nhịp tim',
//       'Cholesterol',
//       'Glucose'
//     ];

//     return DataTable(
//       columns: getColumns(columns),
//       rows: getRows(data),
//     );
//   }

//   List<DataColumn> getColumns(List<String> columns) {
//     return columns
//         .map((String column) => DataColumn(label: Text(column)))
//         .toList();
//   }

//   List<DataRow> getRows(List<DataResponse> data) {
//     return data.map((DataResponse data) {
//       DateTime? date = data.createdAt;

//       var inputFormat = DateFormat('dd/MM/yyyy').format(date!);
//       // var inputDate = DateTi;/
//       // var outputDate = outputFormat.format(inputDate);
//       final cells = [
//         inputFormat,
//         data.height,
//         data.weight,
//         data.indexBmi,
//         data.systolic,
//         data.diastolic,
//         data.heartRateIndicator,
//         data.cholesterol,
//         data.glucose
//       ];


//       return DataRow(cells: getCells(cells));
//     }).toList();
//   }

//   List<DataCell> getCells(List<dynamic> cells) {
//     return cells.map((data) => DataCell(Text('$data'))).toList();
//   }
// }
