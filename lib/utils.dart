// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

import 'dart:collection';

import 'package:table_calendar/table_calendar.dart';

/// Example event class.
class Event {
  final String title;

  const Event(this.title);

  @override
  String toString() => title;
}

/// Example events.
///
/// Using a [LinkedHashMap] is highly recommended if you decide to use a map.

Map<DateTime, List<Event>> bioevents = {
  DateTime.utc(2022, 1, 6): [
    const Event('Día de los Santos Reyes'),
    // const Event('cumple de Vero')
  ],
  DateTime.utc(2022, 1, 25): [
    const Event('Día del Biólogo'),
  ],
  DateTime.utc(2022, 1, 26): [
    const Event('Día Mundial de la Educación Ambiental'),
  ],
  DateTime.utc(2022, 2, 2): [
    const Event('Día de la Candelaria'),
    const Event('Día Mundial de los Humedales'),
  ],
  DateTime.utc(2022, 2, 5): [
    const Event('Día de la Constitución Mexicana'),
  ],
  DateTime.utc(2022, 2, 13): [
    const Event('Día Nacional del Águila Real'),
  ],
  DateTime.utc(2022, 2, 14): [
    const Event('Día de la Energía'),
    const Event('Día de San Valentín'),
  ],
  DateTime.utc(2022, 2, 24): [
    const Event('Día de la Bandera'),
  ],
  DateTime.utc(2022, 3, 7): [
    const Event('Día del Campo'),
  ],
  DateTime.utc(2022, 3, 14): [
    const Event(
        'Día Mundial de Acción contra las Represas, a favor de los Ríos, el Agua y la Vida'),
  ],
  DateTime.utc(2022, 3, 18): [
    const Event('Aniv. Expropiación Petrolera'),
  ],
  DateTime.utc(2022, 3, 21): [
    const Event('Día Forestal Mundial'),
    const Event('Natalicio de Benito Juárez')
  ],
  DateTime.utc(2022, 3, 22): [
    const Event('Día Mundial del Agua'),
  ],
  DateTime.utc(2022, 3, 23): [
    const Event('Día Meteorológico Mundial'),
  ],
  DateTime.utc(2022, 4, 15): [
    const Event('Viernes Santo'),
  ],
  DateTime.utc(2022, 4, 16): [
    const Event('Sábado de Gloria'),
  ],
  DateTime.utc(2022, 4, 22): [
    const Event('Día Mundial de la Tierra'),
  ],
  DateTime.utc(2022, 4, 28): [
    const Event('Día Nacional de los Jardines Botánicos'),
  ],
  DateTime.utc(2022, 4, 29): [
    const Event('Día del Animal'),
  ],
  DateTime.utc(2022, 4, 30): [
    const Event('Día del Niño'),
  ],
  DateTime.utc(2022, 5, 1): [
    const Event('Día del Trabajo'),
  ],
  DateTime.utc(2022, 5, 4): [
    const Event('Día Internacional del Combatiente de Incendios Forestales'),
  ],
  DateTime.utc(2022, 5, 5): [
    const Event('Aniv. Batalla de Puebla'),
  ],
  DateTime.utc(2022, 5, 9): [
    const Event('Día Internacional de las Aves'),
  ],
  DateTime.utc(2022, 5, 10): [
    const Event('Día de las Madres'),
  ],
  DateTime.utc(2022, 5, 15): [
    const Event('Día del Maestro'),
  ],
  DateTime.utc(2022, 5, 22): [
    const Event('Día Internacional de la Diversidad Biológica'),
  ],
  DateTime.utc(2022, 6, 5): [
    const Event('Día Mundial del Medio Ambiente'),
  ],
  DateTime.utc(2022, 6, 8): [
    const Event('Día Mundial de los Océanos'),
  ],
  DateTime.utc(2022, 6, 17): [
    const Event(
        'Día Mundial de la Lucha contra la Desertificación y la Sequía'),
  ],
  DateTime.utc(2022, 6, 26): [
    const Event(
        'Día Internacional de la Preservación de los Bosques Tropicales'),
  ],
  DateTime.utc(2022, 7, 7): [
    const Event('Día de la Conservación del Suelo'),
  ],
  DateTime.utc(2022, 7, 9): [
    const Event('Día del Árbol'),
  ],
  DateTime.utc(2022, 7, 26): [
    const Event('Día Mundial para la Protección de los Manglares'),
  ],
  DateTime.utc(2022, 8, 14): [
    const Event('Día Interamericano de la Calidad del Aire'),
  ],
  DateTime.utc(2022, 9, 7): [
    const Event('Día Internacional del Manatí'),
  ],
  DateTime.utc(2022, 9, 16): [
    const Event('Día Internacional de la Preservación de la Capa de Ozono'),
    const Event('Aniv. de la Independencia de México')
  ],
  DateTime.utc(2022, 9, 19): [
    const Event('Día Internacional de la Limpieza de las Playas'),
  ],
  DateTime.utc(2022, 9, 27): [
    const Event('Día Nacional de la Conciencia Ambiental'),
  ],
  DateTime.utc(2022, 9, 29): [
    const Event('Día Mundial de los Mares'),
  ],
  DateTime.utc(2022, 10, 5): [
    const Event('Día Mundial del Hábitat'),
  ],
  DateTime.utc(2022, 10, 12): [
    const Event('Día de la Raza'),
  ],
  DateTime.utc(2022, 10, 16): [
    const Event('Día Mundial de la Alimentación'),
  ],
  DateTime.utc(2022, 10, 18): [
    const Event('Día de la Protección a la Naturaleza'),
  ],
  DateTime.utc(2022, 10, 31): [
    const Event('Halloween'),
  ],
  DateTime.utc(2022, 11, 1): [
    const Event('Día Mundial de la Ecología'),
  ],
  DateTime.utc(2022, 11, 2): [
    const Event('Día de los Muertos'),
  ],
  DateTime.utc(2022, 11, 6): [
    const Event(
        'Día Internacional para la Prevención de la Explotación del Medio Ambiente en la Guerra y los Conflictos Armados'),
  ],
  DateTime.utc(2022, 11, 19): [
    const Event('Día Internacional del Aire Puro'),
  ],
  DateTime.utc(2022, 11, 20): [
    const Event('Aniv. Revolución Mexicana'),
  ],
  DateTime.utc(2022, 11, 27): [
    const Event('Día Nacional de la Conservación'),
  ],
  DateTime.utc(2022, 12, 3): [
    const Event('Día Mundial del No Uso de Plaguicidas'),
  ],
  DateTime.utc(2022, 12, 11): [
    const Event('Día Internacional de las Montañas'),
  ],
  DateTime.utc(2022, 12, 12): [
    const Event('Día de la Virgen de Guadalupe'),
  ],
  DateTime.utc(2022, 12, 15): [
    const Event(
        'Creación del Programa de las Naciones Unidas para la Protección del Medio Ambiente'),
  ],
  DateTime.utc(2022, 12, 24): [
    const Event('Noche Buena'),
  ],
  DateTime.utc(2022, 12, 25): [
    const Event('Navidad'),
  ],
};

final kEvents = LinkedHashMap<DateTime, List<Event>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(_bioevents);
// )..addAll(_kEventSource);

final _bioevents = bioevents;

// final _kEventSource = Map.fromIterable(List.generate(50, (index) => index),
//     key: (item) => DateTime.utc(kFirstDay.year, kFirstDay.month, item * 5),
//     value: (item) => List.generate(
//         item % 4 + 1, (index) => Event('Event $item | ${index + 1}')))
//   ..addAll({
//     kToday: [
//       Event('Today\'s Event 1'),
//       Event('Today\'s Event 2'),
//     ],
//   });

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

/// Returns a list of [DateTime] objects from [first] to [last], inclusive.
List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
    (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);

monthlybackground(value) {
  switch (value) {
    case DateTime.january:
      {
        return 'assets/octopus.jpg';
      }
    case DateTime.february:
      {
        return 'assets/ladybugs.jpg';
      }
    case 3:
      {
        return 'assets/flower.jpg';
      }
    case 4:
      {
        return 'assets/fantasy.jpg';
      }
    case 5:
      {
        return 'assets/feather.jpg';
      }
    case 6:
      {
        return 'assets/tree.jpg';
      }
    case 7:
      {
        return 'assets/ape.jpg';
      }
    case 8:
      {
        return 'assets/fly.jpg';
      }
    case 9:
      {
        return 'assets/lumber.jpg';
      }
    case 10:
      {
        return 'assets/spider.jpg';
      }
    case 11:
      {
        return 'assets/drop.jpg';
      }
    case 12:
      {
        return 'assets/abstract.jpg';
      }
    default:
      {
        return 'assets/coronavirus-4952102.jpg';
      }
  }
}

monthlymessage(value) {
  switch (value) {
    case DateTime.january:
      {
        return 'Por la transición del Homo sapiens al Homini naturae';
      }
    case DateTime.february:
      {
        return 'Nada en la naturaleza vive para sí mismo, vivir para el otro es la regla de la naturaleza';
      }
    case 3:
      {
        return 'Resiliencia de frente al cambio';
      }
    case 4:
      {
        return 'Todo en la naturaleza está vivo e influye en tus pensamientos';
      }
    case 5:
      {
        return 'Be duces congnitionis et observantiae';
      }
    case 6:
      {
        return 'En el interior de la naturaleza habita la verdad';
      }
    case 7:
      {
        return 'Por el trabajo a favor del ejercicio profesional de las ciencias biológicas';
      }
    case 8:
      {
        return 'Si permaneces cerca de la naturaleza, inesperadamente puede volverse grandiosa e inconmensurable';
      }
    case 9:
      {
        return 'Por la armonía entre Sociedad y Naturaleza';
      }
    case 10:
      {
        return 'Evitemos la sexta extinción masiva; con nuestros conocimientos, fortaleza y unión podemos lograr el cambio.';
      }
    case 11:
      {
        return 'Una hoja solitaria baila en la brisa, testimonio de la libertad de la naturaleza';
      }
    case 12:
      {
        return 'Cuando observas el cielo nocturno, no eres tú viendo el universo, sino el universo viéndose a sí mismo en forma humana';
      }
    default:
      {
        return 'Todo en la naturaleza está vivo e influye en tus pensamientos, te des cuenta o no. ¿Quién puede decir que la roca no escucha tus pensamientos? ¿O el río? ¿O las cadenas montañosas? Todos pertenecemos a este mundo viviente y no hay nada que no sea parte de él';
      }
  }
}
