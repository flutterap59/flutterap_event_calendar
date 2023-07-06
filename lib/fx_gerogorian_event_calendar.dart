library flutterap_event_calendar;

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'components/fx_english_date_picker.dart';
//Event calendar with the ability to move,drag , add and edit events
class FxGeogorianEventCalendar extends StatefulWidget {
  const FxGeogorianEventCalendar({Key? key}) : super(key: key);

  @override
  State<FxGeogorianEventCalendar> createState() =>
      _FxGeogorianEventCalendarState();
}

class _FxGeogorianEventCalendarState extends State<FxGeogorianEventCalendar> {
  final List<Appointment> _appointments = <Appointment>[];
  final CalendarController _calendarController = CalendarController();
  final TextEditingController _addController = TextEditingController();
  final TextEditingController _editController = TextEditingController();

  late Appointment _draggedAppointment;
  late DateTime _newAppointmentDate;

  DateTime _date = DateTime.now();
  DateTime _dateAdd = DateTime.now();

  // ignore: prefer_final_fields
  DateTime _dateEdit = DateTime.now();

  @override
  void initState() {
    super.initState();

    // Add some sample appointments
    _appointments.add(
      Appointment(
        startTime: DateTime.now().add(const Duration(days: 1)),
        endTime: DateTime.now().add(const Duration(days: 1, hours: 1)),
        subject: 'Event 1',
        color: const Color(0xff3761EB),
      ),
    );

    _appointments.add(
      Appointment(
          startTime: DateTime.now().add(const Duration(days: 3)),
          endTime: DateTime.now().add(const Duration(days: 7, hours: 1)),
          subject: 'Event 2',
          color: const Color(0xff3761EB)),
    );
    _appointments.add(
      Appointment(
          startTime: DateTime.now().add(const Duration(days: 7)),
          endTime: DateTime.now().add(const Duration(days: 7, hours: 1)),
          subject: 'Event 3',
          color: const Color(0xff3761EB)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 600,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(25))),
      child: SfCalendar(
        view: CalendarView.month,
        controller: _calendarController,
        dataSource: _getDataSource(),
        headerStyle:
            const CalendarHeaderStyle(textStyle: TextStyle(fontSize: 20)),
        viewHeaderStyle: const ViewHeaderStyle(
          dayTextStyle: TextStyle(color: Colors.black, fontSize: 16),
        ),
        appointmentBuilder: _appointmentBuilder,
        monthCellBuilder: _monthCellBuilder,
        todayTextStyle: const TextStyle(fontSize: 20),
        selectionDecoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xff3761EB),
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        monthViewSettings: const MonthViewSettings(
            appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
        todayHighlightColor: const Color(0xff38BDF8),
        allowDragAndDrop: true,
        allowAppointmentResize: true,
        onTap: (detail) {
          setState(() {
            _date = detail.date ?? DateTime.now();
            _dateAdd = detail.date ?? DateTime.now();
          });
          _addEvent(context);
        },
        onLongPress: (details) {
          _draggedAppointment = details.appointments!.first;
          _newAppointmentDate = details.date!;
          setState(() {});
        },
        onDragUpdate: (details) {
          // _newAppointmentDate = details.date;
          setState(() {});
        },
        onDragEnd: (details) {
          _draggedAppointment.startTime =
              _newAppointmentDate.subtract(const Duration(hours: 1));
          _draggedAppointment.endTime = _newAppointmentDate;
          setState(() {});
        },
      ),
    );
  }

  Widget _appointmentBuilder(
      BuildContext context, CalendarAppointmentDetails details) {
    if (details.isMoreAppointmentRegion) {
      return SizedBox(
        width: details.bounds.width,
        height: details.bounds.height,
        child: InkWell(
          child: const Text(
            '+More',
            style: TextStyle(color: Color(0xff3761EB), fontSize: 12),
          ),
          onTap: () {
            _showMoreEvents(context, details);
          },
        ),
      );
    } else if (_calendarController.view == CalendarView.month) {
      final Appointment appointment = details.appointments.first;
      return InkWell(
        child: Container(
            width: details.bounds.width,
            height: details.bounds.height,
            decoration: BoxDecoration(
              color: appointment.color,
              border: Border.all(color: const Color(0xffE4E6E8)),
              borderRadius: BorderRadius.circular(5),
            ),
            alignment: Alignment.center,
            child: Text(
              appointment.subject,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            )),
        onTap: () {
          setState(() {
            _date = details.date;
            _editController.text = details.appointments.first.subject;
          });

          _editEvent(context, details.appointments.first.id);
        },
      );
    } else {
      final Appointment appointment = details.appointments.first;
      return SizedBox(
        width: details.bounds.width,
        height: details.bounds.height,
        child: InkWell(
          child: Text(
            appointment.subject,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
          onTap: () {
            setState(() {
              _date = details.date;
              _editController.text = details.appointments.first.subject;
            });

            _editEvent(context, details.appointments.first.id);
          },
        ),
      );
    }
  }

  Widget _monthCellBuilder(BuildContext context, MonthCellDetails details) {
    return Container(
      decoration: BoxDecoration(
        color: (details.date.day == DateTime.now().day &&
                details.date.month == DateTime.now().month)
            ? const Color(0xff8b9dd9)
            : Colors.transparent,
        border: Border.all(
          color: const Color(0xffE4E6E8),
        ),
      ),
      child: Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Text(
              details.date.day.toString(),
              style: TextStyle(
                  color: details.date.month == DateTime.now().month
                      ? Colors.black
                      : Colors.black54),
            ),
          )),
    );
  }

  _DataSource _getDataSource() {
    return _DataSource(_appointments);
  }

  //Add Event Dialog by press on day cell
  Future<dynamic> _addEvent(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Add event"),
          backgroundColor: Colors.white,
          actions: <Widget>[
            Column(
              children: [
                const Text("Please enter event name:"),
                const SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: _addController,
                ),
                const SizedBox(
                  height: 16,
                ),
                FxEnglishDatePicker(
                  title: "Pick end date",
                  initialTime: _dateAdd,
                  onChange: (date) {
                    setState(() {
                      _dateAdd = date ?? _date;
                    });
                    Navigator.pop(context, date);
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  child: const Text("ok"),
                  onPressed: () {
                    setState(() {
                      _appointments.add(
                        Appointment(
                          startTime: _dateAdd,
                          endTime: _dateAdd.add(const Duration(hours: 1)),
                          subject: _addController.text,
                        ),
                      );
                      _addController.text = "";
                    });

                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ],
        );
      },
    ).then((val) {
      setState(() {
        if (val.runtimeType == DateTime.now().runtimeType) {
          _appointments.add(
            Appointment(
                startTime: _dateAdd,
                endTime: _dateAdd.add(const Duration(hours: 1)),
                subject: _addController.text,
                color: const Color(0xff3761EB)),
          );
        }

        _addController.text = "";
      });
    });
  }

  //Edit Event Dialog by press on event
  Future<dynamic> _editEvent(BuildContext context, int id) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Edit event"),
          backgroundColor: Colors.white,
          actions: <Widget>[
            Column(
              children: [
                const Text("Please edit event name:"),
                const SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: _editController,
                  maxLines: 7,
                ),
                const SizedBox(
                  height: 16,
                ),
                FxEnglishDatePicker(
                  title: "Pick end date",
                  initialTime: _dateEdit,
                  onChange: (editDate) {
                    _appointments[_getAppointmentIndex(id)].subject =
                        _editController.text;
                    _appointments[_getAppointmentIndex(id)].startTime =
                        editDate ?? _date;
                    _appointments[_getAppointmentIndex(id)].endTime =
                        (editDate ?? _date).add(const Duration(hours: 1));
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        _appointments
                            .remove(_appointments[_getAppointmentIndex(id)]);
                        setState(() {});
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                    ElevatedButton(
                      child: const Text("ok"),
                      onPressed: () {
                        _appointments[_getAppointmentIndex(id)].subject =
                            _editController.text;
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
              ],
            ),
          ],
        );
      },
    ).then((val) {
      setState(() {
        _editController.text = "";
      });
    });
  }

  //Get Appointment Index
  int _getAppointmentIndex(int id) {
    int appointmentIndex = 0;

    for (int i = 0; i < _appointments.length; i++) {
      if (_appointments[i].id == id) {
        appointmentIndex = i;
      }
    }
    return appointmentIndex;
  }


  //Show More Events
  Future<dynamic> _showMoreEvents(
      BuildContext context, CalendarAppointmentDetails details) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          actions: <Widget>[
            SizedBox(
              height: 400,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Events",
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    ...List.generate(details.appointments.length, (index) {
                      final Appointment appointment =
                          details.appointments.elementAt(index);
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: InkWell(
                          child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              alignment: Alignment.center,
                              height: 20,
                              decoration: BoxDecoration(
                                color: appointment.color,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                appointment.subject,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              )),
                          onTap: () {
                            setState(() {
                              _date = details.date;
                              _editController.text =
                                  details.appointments.first.subject;
                            });

                            _editEvent(context, details.appointments.first.id);
                          },
                        ),
                      );
                    })
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _DataSource extends CalendarDataSource {
  _DataSource(List<Appointment> source) {
    appointments = source;
  }
}
