import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/order/OrdersScreen.dart';
import 'package:flutter_app/widgets/over_view/overview_worker_screen.dart';

class Destination {
  const Destination({this.widget, this.title, this.icon, this.color});

  final Widget widget;
  final String title;
  final IconData icon;
  final MaterialColor color;
}

List<Destination> allDestinations = [
  Destination( widget: new OverViewScreen(), title: 'Overview', icon: Icons.home, color: Colors.teal),
  Destination( widget: new OrderScreen(), title: 'Orders', icon: Icons.cake ,color: Colors.orange),
];
