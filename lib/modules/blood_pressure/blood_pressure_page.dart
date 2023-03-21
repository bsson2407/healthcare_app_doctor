import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_app_doctor/models/health-record/health_record_response.dart';
import 'package:healthcare_app_doctor/modules/infor/infor_controller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';

class BloodPressurePage extends StatefulWidget {
  BloodPressurePage({Key? key}) : super(key: key);

  @override
  State<BloodPressurePage> createState() => _BloodPressurePageState();
}

class _BloodPressurePageState extends State<BloodPressurePage> {
  final inforController = Get.find<InforController>();

  late List<SalesData> _chartData;
  @override
  void initState() {
    // TODO: implement initState
    _chartData = getChartData(inforController.dataList.cast<DataResponse>());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SfCartesianChart(
        title: ChartTitle(text: "Chỉ số huyết áp"),
        legend: Legend(isVisible: true),
        series: <ChartSeries>[
          LineSeries<SalesData, DateTime>(
              name: "Tâm thu",
              dataSource: _chartData,
              xValueMapper: (SalesData sales, _) => sales.date,
              yValueMapper: (SalesData sales, _) => sales.systolic.toDouble(),
              dataLabelSettings: DataLabelSettings(isVisible: true)),
          LineSeries<SalesData, DateTime>(
              name: "Tâm trương",
              dataSource: _chartData,
              xValueMapper: (SalesData sales, _) => sales.date,
              yValueMapper: (SalesData sales, _) => sales.diastolic.toDouble(),
              dataLabelSettings: DataLabelSettings(isVisible: true)),
        ],
        primaryXAxis: DateTimeAxis(
          edgeLabelPlacement: EdgeLabelPlacement.shift,
          dateFormat: DateFormat('dd/MM/yyyy'),
          labelFormat: '{value}',
        ),
        // primaryYAxis: NumericAxis(numberFormat: NumberFormat.simpleCurrency(decimalDigits: 0)),
      ),
    ));
  }

  List<SalesData> getChartData(List<DataResponse> data) {
    final List<SalesData> salesData = [];
    for (int i = 0; i < data.length; i++) {
      DateTime? date = data[i].createdAt;
      var inputFormat = DateFormat('dd/MM/yyyy').format(date!);
      salesData.add(SalesData(date, data[i].systolic!, data[i].diastolic!));
    }

    return salesData;
  }
}

class SalesData {
  SalesData(this.date, this.systolic, this.diastolic);
  final DateTime date;
  final String systolic;
  final String diastolic;
}
