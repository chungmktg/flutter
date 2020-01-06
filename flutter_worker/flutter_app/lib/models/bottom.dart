
import 'package:flutter/material.dart';

class Destination {
  const Destination(this.title, this.icon, this.color);
  final String title;
  final IconData icon;
  final MaterialColor color;
  
}

const List<Destination> allDestinations = <Destination>[
  Destination('Overview', Icons.home, Colors.teal),
  Destination('Order', Icons.business, Colors.cyan),
  Destination('My job', Icons.school, Colors.orange),
  Destination('Reading Log', Icons.flight, Colors.blue),
  Destination('Profile', Icons.people, Colors.red)
];