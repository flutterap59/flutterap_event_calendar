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
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SizedBox(

            height: 700,
            child: FxGeogorianEventCalendar(
              onViewChanged: (details){},
              onAddEvent: (details){},
              onAppointmentResizeEndCell: (details){},
              onAppointmentResizeStartCell: (details){},
              onAppointmentResizeUpdateCell: (details){},
              onDeleteEvent: (details){},
              onDragEndCell: (details){},
              onDragStartCell: (details){},
              onDragUpdateCell: (details){},
              onEditEvent: (details){},
              onLongPressCell: (details){},
              onSelectionChangedCell: (details){},
              onTapCell: (details){},


            )),
      ),
    );
  }
}

