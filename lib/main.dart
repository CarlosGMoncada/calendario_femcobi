import 'package:flutter/material.dart';
import '../models/models.dart';
import 'package:intl/date_symbol_data_local.dart';
//import 'package:table_calendar/table_calendar.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themedark = ThemeData.dark();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themedark,
      //primarySwatch: Colors.red,
      home: const MyHomePage(title: 'Calendario FEMCOBI 2022'),
    );
  }
}
