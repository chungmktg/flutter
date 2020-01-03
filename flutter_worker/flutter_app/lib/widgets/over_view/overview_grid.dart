import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/Pain/TrianglePainter.dart';

import 'item_over_view.dart';

class GridOverView extends StatefulWidget {
  @override
  _GridOverViewState createState() => _GridOverViewState();
}

class _GridOverViewState extends State<GridOverView> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: ScrollPhysics(),
      primary: true,
      shrinkWrap: true,
      padding: const EdgeInsets.all(16),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      crossAxisCount: 2,
      children: <Widget>[
        ItemOverView(
          numberJob: 1,
          statusJob: "expire today",
          color: Colors.blue,
          background: Colors.red[100],
        ),
        ItemOverView(
          numberJob: 3,
          statusJob: "open today",
          color: Colors.red,
        ),
        ItemOverView(
          numberJob: 2,
          statusJob: "completed",
          color: Colors.orangeAccent,
        ),
        ItemOverView(
          numberJob: 1,
          statusJob: "start today",
          color: Colors.green,
        ),
      ],
    );
  }
}
