
![](assets/images/flutterap_logo.png)

## Flutterap_event_calender
This package is extended from flutterap admin panel
Flutterap is a most developer-friendly, highly customizable admin dashboard template based on Flutter.
It comes with lots of features that make development easier for you.
<a href="https://flutterap.com" rel="nofollow">Website : flutterap.com</a>

## Features

Event calendar with the ability to move,drag , add and edit events

## Add event
![](assets/gifs/calender1_gif.gif)

## Edit event
![](assets/gifs/calender2_gif.gif)

## Flutterap Event Calender

![](assets/images/calrnder2.png)

## Add event
![](assets/images/calrnder3.png)

## Edit event
![](assets/images/calrnder4.png)



```dart
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
            child: FxGeogorianEventCalender()),
      ),
    );
  }
}
```

