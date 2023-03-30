import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_app_doctor/models/health-record/health_record_response.dart';
import 'package:healthcare_app_doctor/modules/infor/infor_controller.dart';
import 'package:healthcare_app_doctor/widgets/sortable_page.dart';
import 'package:intl/intl.dart';

class InforTable extends StatelessWidget {
  final inforController = Get.find<InforController>();

  //  List<DataResponse> lst  =  inforController.initList(id) as List<DataResponse>;
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: ScrollableWidget(child: buildDataTable(inforController.dataList)),
      );
    });
  }

  Widget buildDataTable(RxList<DataResponse> data) {
    final columns = [
      'Ngày',
      'Chiều cao',
      'Cân nặng',
      'Chỉ số BMI',
      'Tâm thu',
      'Tâm trương',
      'Nhịp tim',
      'Cholesterol',
      'Glucose'
    ];

    return DataTable(
      columns: getColumns(columns),
      rows: getRows(data),
    );
  }

  List<DataColumn> getColumns(List<String> columns) {
    return columns
        .map((String column) => DataColumn(label: Text(column)))
        .toList();
  }

  List<DataRow> getRows(RxList<DataResponse> data) {
    return data.map((DataResponse data) {
      DateTime? date = data.createdAt;

      var inputFormat = DateFormat('dd/MM/yyyy').format(date!);
      // var inputDate = DateTi;/
      // var outputDate = outputFormat.format(inputDate);
      final cells = [
        inputFormat,
        data.height,
        data.weight,
        data.indexBmi,
        data.systolic,
        data.diastolic,
        data.heartRateIndicator,
        data.cholesterol,
        data.glucose
      ];

      return DataRow(cells: getCells(cells));
    }).toList();
  }

  List<DataCell> getCells(List<dynamic> cells) {
    return cells.map((data) => DataCell(Text('$data'))).toList();
  }
}
