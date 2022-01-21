import 'package:flutter/material.dart';
import '../models/models.dart';
import 'package:intl/date_symbol_data_local.dart';
//import 'package:table_calendar/table_calendar.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(const MyApp()));
}
// void main() {
//   runApp(const MaterialApp(
//     title: 'Navigation Basics',
//     home: FirstRoute(),
//   ));
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themedark = ThemeData.dark();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themedark,
      //primarySwatch: Colors.red,
      //home: const MyHomePage(title: 'Calendario FEMCOBI 2022'),
      home: const FirstRoute(),
    );
  }
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const int jan = 2;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendario FEMCOBI 2022'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Enero'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const MyHomePage(currentmonth: jan)),
            );
          },
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
