import 'package:flutter/material.dart';

class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agradecimientos'),
      ),
      body: GridView.count(
        mainAxisSpacing: 20.0,
        crossAxisSpacing: 20.0,
        crossAxisCount: 3,
        children: [
          Image.asset('assets/logos/logo_FEMCOBI.png'),
          Image.asset('assets/logos/Logo aguascalientes.png'),
          Image.asset('assets/logos/LOGO BIOAAE.png'),
          Image.asset('assets/logos/LOGO CBQROO.png'),
          Image.asset('assets/logos/LOGO CBZ.png'),
          Image.asset('assets/logos/LOGO chihuahua.png'),
          Image.asset('assets/logos/logo coahuila.png'),
          Image.asset('assets/logos/logo colima.png'),
          Image.asset('assets/logos/Logo durango.png'),
          Image.asset('assets/logos/logo edomex.png'),
          Image.asset('assets/logos/logo guerrero.png'),
          Image.asset('assets/logos/logo Jalisco.png'),
          Image.asset('assets/logos/Logo morelos.png'),
          Image.asset('assets/logos/logo Nuevo leon.png'),
          Image.asset('assets/logos/Logotipo CBBC.png'),
        ],
      ),
    );
  }
}


// ElevatedButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           child: const Text('Go back!'),
//         ),