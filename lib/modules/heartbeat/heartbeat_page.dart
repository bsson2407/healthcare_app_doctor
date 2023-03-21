import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_app_doctor/models/health-record/health_record_response.dart';
import 'package:healthcare_app_doctor/modules/infor/infor_controller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';

class HeartbeatPage extends StatefulWidget {
  HeartbeatPage({Key? key}) : super(key: key);

  @override
  State<HeartbeatPage> createState() => _HeartbeatPageState();
}

class _HeartbeatPageState extends State<HeartbeatPage> {
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
        title: ChartTitle(text: "Chỉ số nhịp tim"),
        legend: Legend(isVisible: true),
        series: <ChartSeries>[
          LineSeries<SalesData, DateTime>(
              name: "nhịp tim",
              color: Colors.green[100],
              dataSource: _chartData,
              xValueMapper: (SalesData sales, _) => sales.date,
              yValueMapper: (SalesData sales, _) =>
                  sales.heartRateIndicator.toDouble(),
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
      salesData.add(SalesData(date, data[i].heartRateIndicator!));
    }

    return salesData;
  }
}

class SalesData {
  SalesData(this.date, this.heartRateIndicator);
  final DateTime date;
  final String heartRateIndicator;
}
