import 'package:flutter/material.dart';
import '../models/models.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themedark = ThemeData.light();
    return MaterialApp(
      title: 'Calendario FEMCOBI 2022',
      theme: themedark,
      //primarySwatch: Colors.red,
      home: const FirstRoute(),
    );
  }
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: const Text('Calendario FEMCOBI 2022'),
        // ),
        body: Center(
      child: Column(children: [
        Stack(children: [
          Image.asset(
            'assets/bee.jpg',
            width: double.infinity,
            // fit: BoxFit.cover,
          ),
          Center(
            child: Text('Calendario FEMCOBI 2022'),
          ),
        ]),
        Container(
            padding: EdgeInsets.all(10.0),
            child: Image.asset(
              'assets/logos/logo_FEMCOBI.png',
              // width: 200,
            )),
        ElevatedButton(
          child: const Text('Calendario'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyHomePage()),
            );
          },
        ),
        ElevatedButton(
          child: const Text('Agradecimientos'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SecondRoute()),
            );
          },
        ),
      ]),
    ));
  }
}
