import 'package:Brolog/db/student_db/studentdb.dart';
import 'package:flutter/material.dart';
import '../../widgets/ElevatedButton.dart';
import 'package:table_calendar/table_calendar.dart';
import 'home_attendance.dart';
import 'view_attendance.dart';

class DateAttendanceScreen extends StatefulWidget {
  final String batch_name;
  DateAttendanceScreen({
    super.key,
    required this.batch_name,
  });

  @override
  State<DateAttendanceScreen> createState() => _DateAttendanceScreenState();
}

class _DateAttendanceScreenState extends State<DateAttendanceScreen> {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    String batch_name = widget.batch_name;
    getallstudents(batch_name);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Column(
            children: [
              Text("$batch_name : Attendance"),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Container(
              child: TableCalendar(
                headerStyle: HeaderStyle(),
                selectedDayPredicate: (day) => isSameDay(day, today),
                focusedDay: today,
                firstDay: DateTime(2020),
                lastDay: DateTime.now(),
                onDaySelected: _onDaySelected,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            MyElevatedButton(
              text: 'Take Attendance',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeAttendanceScreen(
                          selected_date: today,
                          batch_name: '${widget.batch_name}')),
                );
              },
            ),
            // Text(
            //   '${today.year}/${today.month}/${today.day}',
            //   style: TextStyle(
            //     color: Colors.black,
            //     fontSize: 18,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            const SizedBox(
              height: 30,
            ),
            MyElevatedButton(
              text: 'View Attendance',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ViewAttendanceScreen(
                          batch_name: '${widget.batch_name}')),
                );
              },
            ),
          ],
        ));
  }

  popoutfuction(BuildContext context) {
    return Navigator.of(context).pop();
    //return Navigator.pop(context);
    //return Navigator.pushNamed(context, '/home');
  }
}
