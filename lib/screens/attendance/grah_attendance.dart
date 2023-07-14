import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class GraphAttendanceScreen extends StatefulWidget {
  final List<dynamic> list;
  final String count;
  GraphAttendanceScreen({
    super.key,
    required this.list,
    required this.count,
  });

  @override
  State<GraphAttendanceScreen> createState() => _GraphAttendanceScreenState();
}

class _GraphAttendanceScreenState extends State<GraphAttendanceScreen> {
  // final String batch_name;
  @override
  Widget build(BuildContext context) {
    List<dynamic> absent_list = widget.list;
    double length = absent_list.length.toDouble();
    String present = widget.count;
    print("length=${length}");
    Map<String, double> dataMap = {
      "Absent": length,
      "Present": 5,
    };
    //String batch_name = batch_name;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: [
            Text("Attendance"),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
      body: Container(
        child: Center(
          child: PieChart(
            dataMap: dataMap,
            chartRadius: MediaQuery.of(context).size.width / 1.7,
            legendOptions: LegendOptions(legendPosition: LegendPosition.bottom),
            chartValuesOptions:
                ChartValuesOptions(showChartValuesInPercentage: true),
          ),
        ),
      ),
    );
  }

  popoutfuction(BuildContext context) {
    return Navigator.of(context).pop();
    //return Navigator.pop(context);
    //return Navigator.pushNamed(context, '/home');
  }
}
