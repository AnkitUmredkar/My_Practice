import 'package:flutter/material.dart';

class DateTimeFromCalender extends StatefulWidget {
  const DateTimeFromCalender({super.key});

  @override
  State<DateTimeFromCalender> createState() => _DateTimeFromCalenderState();
}

String date = '';

class _DateTimeFromCalenderState extends State<DateTimeFromCalender> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: timePicker(context),
      ),
    );
  }

  Center timePicker(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              date,
              style: const TextStyle(fontSize: 25, color: Colors.black),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() async {
                  TimeOfDay? datePicked = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                    initialEntryMode: TimePickerEntryMode.dial,
                  );
                  if (datePicked != null) {
                    setState(() {
                      date =
                      'Time : ${datePicked.minute} - ${datePicked.hour}';
                    });
                  }
                });
              },
              child: const Text('Date Time'),
            ),
          ],
        ),
      );
  }

  //todo Date Picker
  Center datePicker(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            date,
            style: const TextStyle(fontSize: 25, color: Colors.black),
          ),
          const SizedBox(height: 10),
          ElevatedButton (
            onPressed: () {
              setState(() async {
                DateTime? datePicked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2018),
                  lastDate: DateTime(2030),
                );
                if (datePicked != null) {
                  setState(() {
                    date =
                    'Date : ${datePicked.day} - ${datePicked.month} - ${datePicked.year}';
                  });
                }
              });
            },
            child: const Text('Date Time'),
          ),
        ],
      ),
    );
  }
}

