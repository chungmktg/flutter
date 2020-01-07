import 'package:flutter/material.dart';
import 'package:flutter_app/models/bottom.dart';
import 'package:flutter_app/widgets/over_view/overview_worker_screen.dart';

class DestinationView extends StatefulWidget {
  const DestinationView({ Key key, this.destination }) : super(key: key);

  final Destination destination;

  @override
  _DestinationViewState createState() => _DestinationViewState();
}

class _DestinationViewState extends State<DestinationView> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.destination.color[100],
      body: widget.destination.widget
    );
  }
}