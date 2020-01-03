import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/Pain/TrianglePainter.dart';


class ItemOverView extends StatelessWidget {
  int numberJob = 0;
  String statusJob = "start today";
  Color color = Colors.blue;
  Color background = Colors.white;

  ItemOverView({this.numberJob, this.statusJob, this.color, this.background});
  @override
  Widget build(BuildContext context) {
    return  Card(
          elevation: 5,
          child: Container(
            child: Stack(
              children: <Widget>[
                Positioned(
                  right: 0,
                  top: 0,
                  child: CustomPaint(
                    painter: TrianglePainter(
                        strokeColor: color,
                        strokeWidth: 10,
                        paintingStyle: PaintingStyle.fill),
                    child: Container(
                      height: 50,
                      width: 50,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Stack(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Row(
                              children: <Widget>[
                                SizedBox(
                                  width: 30,
                                ),
                                Text(
                                  '$numberJob',
                                  style: TextStyle(
                                      fontSize: 60,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '${(numberJob > 1) ? 'jobs' : 'job'}',
                                  style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.blueGrey,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          Text('$statusJob',
                              style: TextStyle(
                                  fontSize: 20, color: Colors.blueGrey))
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
                color: background,
                border: Border.all(color: Colors.blueGrey, width: 0.5),
                borderRadius: BorderRadius.all(Radius.circular(5))),
          ),
        );
  }
}