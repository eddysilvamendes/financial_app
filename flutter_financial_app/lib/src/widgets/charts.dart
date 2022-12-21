// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Chart extends StatefulWidget {
  const Chart({Key? key}) : super(key: key);

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        series: <SplineSeries<SalesData, String>>[
          SplineSeries<SalesData, String>(
            color: const Color.fromARGB(255, 47, 125, 121),
            width: 3,
            dataSource: <SalesData>[
              SalesData(sales: 100, year: 'Mon'),
              SalesData(sales: 20, year: 'Tue'),
              SalesData(sales: 40, year: 'Wen'),
              SalesData(sales: 15, year: 'Sat'),
              SalesData(sales: 5, year: 'Sun'),
            ],
            xValueMapper: (SalesData sales, _) => sales.year,
            yValueMapper: (SalesData sales, _) => sales.sales,
          ),
        ],
      ),
    );
  }
}

class SalesData {
  final String year;
  final int sales;
  SalesData({
    required this.year,
    required this.sales,
  });
}
