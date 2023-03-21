import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_app_doctor/models/health-record/health_record_response.dart';
import 'package:healthcare_app_doctor/modules/infor/infor_controller.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CholesterolPage extends StatefulWidget {
  CholesterolPage({Key? key}) : super(key: key);

  @override
  State<CholesterolPage> createState() => _CholesterolPageState();
}

class _CholesterolPageState extends State<CholesterolPage> {
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
        title: ChartTitle(text: "Chỉ số Cholesterol"),
        legend: Legend(isVisible: true),
        series: <ChartSeries>[
          LineSeries<SalesData, DateTime>(
              name: "cholesterol",
              color: Colors.orange[200],
              dataSource: _chartData,
              xValueMapper: (SalesData sales, _) => sales.date,
              yValueMapper: (SalesData sales, _) =>
                  sales.cholesterol.toDouble(),
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
      salesData.add(SalesData(date, data[i].cholesterol!));
    }

    return salesData;
  }
}

class SalesData {
  SalesData(this.date, this.cholesterol);
  final DateTime date;
  final String cholesterol;
}
