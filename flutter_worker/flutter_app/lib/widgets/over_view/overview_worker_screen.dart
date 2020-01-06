import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../strings.dart';
import 'overview_grid.dart';
import 'overview_sum.dart';

class OverViewScreen extends StatefulWidget {
  @override
  _OverViewScreenState createState() => _OverViewScreenState();

  OverViewScreen();
}

class _OverViewScreenState extends State<OverViewScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Text(
              over_view,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: ListView(
            shrinkWrap: true,
            children: <Widget>[
              GridOverView(),
              SumJobOverView()
              ],
          )),
    );
  }
}
