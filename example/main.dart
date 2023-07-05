import 'package:flutter/material.dart';
import 'package:flutterap_event_calendar/fx_gerogorian_event_calendar.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key,});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SizedBox(

            height: 700,
            child: FxGeogorianEventCalendar()),
      ),
    );
  }
}

