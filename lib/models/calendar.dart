import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils.dart';
import 'dart:convert';
import 'dart:collection';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  _TableEventsExampleState createState() => _TableEventsExampleState();
}

class _TableEventsExampleState extends State<MyHomePage> {
  late final ValueNotifier<List<Event>> _selectedEvents;
  late Map<DateTime, List<Event>> _userEvents;
  late LinkedHashMap<DateTime, List<Event>> allEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOff; // Can be toggled on/off by longpressing a date
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  int? imageindex;
  late SharedPreferences prefs;

  TextEditingController _eventController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _eventController = TextEditingController();
    _selectedDay = _focusedDay;
    imageindex = _focusedDay.month;
    prefsData();
    _userEvents = {};
    allEvents = kEvents..addAll(_userEvents);
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
    print(allEvents);
  }

  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }

  prefsData() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      _userEvents = Map<DateTime, List<Event>>.from(
          decodeMap(json.decode(prefs.getString("events") ?? "{}")));
    });
  }

  Map<String, dynamic> encodeMap(Map<DateTime, List<Event>> map) {
    Map<String, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[key.toString()] = map[key];
    });
    return newMap;
  }

  Map<DateTime, List<Event>?> decodeMap(Map<String, dynamic> map) {
    Map<DateTime, List<Event>?> newMap = {};
    map.forEach((key, value) {
      newMap[DateTime.parse(key)] = map[key];
    });
    return newMap;
  }

  List<Event> _getEventsForDay(DateTime day) {
    // Implementation example
    return allEvents[day] ?? [];
  }

  List<Event> _getEventsForRange(DateTime start, DateTime end) {
    // Implementation example
    final days = daysInRange(start, end);

    return [
      for (final d in days) ..._getEventsForDay(d),
    ];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null; // Important to clean those
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });

      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });

    // `start` or `end` could be null
    if (start != null && end != null) {
      _selectedEvents.value = _getEventsForRange(start, end);
    } else if (start != null) {
      _selectedEvents.value = _getEventsForDay(start);
    } else if (end != null) {
      _selectedEvents.value = _getEventsForDay(end);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendario FEMCOBI 2022'),
      ),
      body: Column(
        children: [
          TableCalendar<Event>(
            locale: 'es_MX',
            firstDay: DateTime.utc(2022, 1, 1),
            lastDay: DateTime.utc(2022, 12, 31),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            rangeStartDay: _rangeStart,
            rangeEndDay: _rangeEnd,
            calendarFormat: _calendarFormat,
            rangeSelectionMode: _rangeSelectionMode,
            eventLoader: _getEventsForDay,
            startingDayOfWeek: StartingDayOfWeek.monday,
            calendarStyle: const CalendarStyle(
              // Use `CalendarStyle` to customize the UI
              outsideDaysVisible: false,
            ),
            onDaySelected: _onDaySelected,
            onRangeSelected: _onRangeSelected,
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
              setState(() {
                imageindex = focusedDay.month;
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              monthlymessage(imageindex),
              textAlign: TextAlign.left,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(monthlybackground(imageindex)),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                ValueListenableBuilder<List<Event>>(
                  valueListenable: _selectedEvents,
                  builder: (context, value, _) {
                    return ListView.builder(
                      itemCount: value.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 12.0,
                            vertical: 4.0,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: ListTile(
                            onTap: () => print('${value[index]}'),
                            title: Stack(
                              children: <Widget>[
                                // Stroked text as border.
                                Text(
                                  '${value[index]}',
                                  style: TextStyle(
                                    fontSize: 17,
                                    foreground: Paint()
                                      ..style = PaintingStyle.stroke
                                      ..strokeWidth = 3
                                      ..color = Colors.black,
                                  ),
                                ),
                                // Solid text as fill.
                                Text(
                                  '${value[index]}',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.grey[300],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
                Align(
                    alignment: Alignment.bottomRight,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.30,
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: Stack(
                        children: [
                          ShaderMask(
                            shaderCallback: (bounds) {
                              return const RadialGradient(
                                center: Alignment.center,
                                radius: 0.4,
                                colors: [
                                  Colors.black,
                                  Color(0xaaffffff),
                                  Colors.transparent
                                ],
                              ).createShader(bounds);
                            },
                            blendMode: BlendMode.dstIn,
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                          Center(
                              child: Padding(
                            padding: const EdgeInsets.all(17.0),
                            child: Image(
                              image: AssetImage(
                                monthlylogo(imageindex),
                              ),
                            ),
                          ))
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: const Text("Agregar evento"),
                  content: TextFormField(controller: _eventController),
                  actions: [
                    TextButton(
                      child: const Text("Ok"),
                      onPressed: () {
                        if (_eventController.text.isEmpty) {
                          print("no hay nada");
                          return;
                        }
                        setState(() {
                          if (_userEvents[_selectedDay] != null) {
                            _userEvents[_selectedDay]!
                                .add(Event(_eventController.text));
                          } else {
                            _userEvents[_selectedDay!] = [
                              Event(_eventController.text)
                            ];
                          }
                          prefs.setString(
                              "events", jsonEncode(encodeMap(_userEvents)));
                          _eventController.clear();
                          /* setState(() {}); */
                        });
                        setState(() {});
                        Navigator.pop(context);
                        return;
                      },
                    ),
                    TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Cancelar"))
                  ],
                )),
        label: const Text("agregar evento"),
        icon: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
