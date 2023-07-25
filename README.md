
<img src="https://github.com/flutterap59/flutterap_event_calendar/raw/main/assets/images/flutterap_logo.png" />

## flutterap_event_calender

This package is extended from flutterap admin panel Flutterap is a most developer-friendly, highly customizable admin dashboard template based on Flutter. It comes with lots of features that make development easier for you.
<a href="https://flutterap.com" rel="nofollow">Website : flutterap.com</a>
##
<a href="https://www.buymeacoffee.com/flutterap" rel="nofollow"><img src="https://github.com/flutterap59/flutterap_event_calendar/raw/main/assets/images/buyme.png" /></a>

##

<a href="https://www.flutterap.com/features" rel="nofollow"><img src="https://github.com/flutterap59/flutterap_event_calendar/raw/main/assets/images/contact_us.png" /></a>
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
              onTapCell: (details){},
              onAddEvent: (details){},
              onEditEvent: (details){},
              onDeleteEvent: (details){},
              onAppointmentResizeEndCell: (details){},
              onAppointmentResizeStartCell: (details){},
              onAppointmentResizeUpdateCell: (details){},
              onDragEndCell: (details){},
              onDragStartCell: (details){},
              onDragUpdateCell: (details){},
              onLongPressCell: (details){},
              onSelectionChangedCell: (details){},


            )),
      ),
    );
  }
}
```


### Functions

| Name       	        | Description                         	                      |
|---------------------|------------------------------------------------------------|
| onViewChanged 	            | Called when Event Calendar page is changed into new month. |
| onTapCell	 	 | Called when clicking on the day cell. 	                    |
| onAddEvent	 	 | Called when an event is added.                             |
| onDeleteEvent	 	 | Called when an event is deleted.                           |
| onEditEvent	 	    | Called when an event is edited.	                           |
| onAppointmentResizeEndCell	 	   | Called when appointment cell resizing ends.	               |
| onAppointmentResizeStartCell	 	    | Called when appointment cell resizing starts.	             |
| onAppointmentResizeUpdateCell	 	  | Called when appointment cell resizing updates. 	           |
| onDragEndCell 	            | Called when appointment cell draging ends.                        |
| onDragStartCell	 	 | Called when appointment cell draging starts.       	              |
| onDragUpdateCell	 	   | Called when appointment cell draging updates.       	             |
| onLongPressCell	 	  | Called when long pressing on the day cell.  	              |
| onSelectionChangedCell	 	  | Called when selecting on the day cell. 	 	                 |



