import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_app/models/piechart_data.dart';

class SumJobOverView extends StatefulWidget {
  final Widget child;
  SumJobOverView({Key key, this.child}) : super(key: key);

  @override
  _SumJobOverViewState createState() => _SumJobOverViewState();
}

class _SumJobOverViewState extends State<SumJobOverView> {
  List<charts.Series<Task, String>> _seriesPieData;

  _generateData() {
    var piedata = [
      new Task(task: 'work', taskValue: 20, colorval: Colors.blue),
      new Task(task: 'flutter', taskValue: 20, colorval: Colors.green),
      new Task(task: 'ios', taskValue: 20, colorval: Colors.orangeAccent),
      new Task(task: 'kotlin', taskValue: 20, colorval: Colors.redAccent),
      new Task(task: 'python', taskValue: 20, colorval: Colors.pinkAccent),
    ];
    _seriesPieData.add(
      charts.Series(
        domainFn: (Task task, _) => task.task,
        measureFn: (Task task, _) => task.taskValue,
        colorFn: (Task task, _) =>
            charts.ColorUtil.fromDartColor(task.colorval),
        id: 'Air Pollution',
        data: piedata,
        labelAccessorFn: (Task row, _) => '${row.taskValue}',
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _seriesPieData = List<charts.Series<Task, String>>();
    _generateData();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
          side: BorderSide(color: Colors.grey, width: 0.5)),
      margin: EdgeInsets.all(20),
      elevation: 5,
      child: Stack(
        children: <Widget>[
          ListBody(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 50, 10, 10),
                child: Text('you have',
                    style: TextStyle(fontSize: 20, color: Colors.blueGrey)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 10, 10),
                child: Row(
                  children: <Widget>[
                    Text(
                      '1',
                      style: TextStyle(
                          fontSize: 60,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 10, 10, 10),
                      child: Text(
                        'job',
                        style: TextStyle(
                            fontSize: 60,
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 10, 50),
                child: Text('start today',
                    style: TextStyle(fontSize: 20, color: Colors.blueGrey)),
              )
            ],
          ),
          Positioned(
              width: 220,
              height: 220,
              top: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0,30,0,0),
                child: Column(
                  children: <Widget>[
                    Expanded(
                        child: charts.PieChart(_seriesPieData,
                            animate: true,
                            animationDuration: Duration(seconds: 5),
                            defaultRenderer: new charts.ArcRendererConfig(
                              arcWidth: 40,
                            ))),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}


