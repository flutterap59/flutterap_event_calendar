
<img src="https://github.com/flutterap59/flutterap_event_calendar/raw/main/assets/images/flutterap_logo.png" />

## flutterap_event_calender

This package is extended from flutterap admin panel Flutterap is a most developer-friendly, highly customizable admin dashboard template based on Flutter. It comes with lots of features that make development easier for you.
<a href="https://flutterap.com" rel="nofollow">Website : flutterap.com</a>
##

## Features

Event calendar with the ability to move,drag , add and edit events

### Add event
<img src="https://github.com/flutterap59/flutterap_event_calendar/raw/main/assets/gifs/calendar1_gif.gif" />


### Edit event
<img src="https://github.com/flutterap59/flutterap_event_calendar/raw/main/assets/gifs/calendar2_gif.gif" />


### Flutterap Event Calender
<img src="https://github.com/flutterap59/flutterap_event_calendar/raw/main/assets/images/calendar2.png" />


### Add event
<img src="https://github.com/flutterap59/flutterap_event_calendar/raw/main/assets/images/calendar3.png" />


### Edit event
<img src="https://github.com/flutterap59/flutterap_event_calendar/raw/main/assets/images/calendar4.png" />


## Usage
```dart

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
```

