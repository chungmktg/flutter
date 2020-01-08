import 'package:flutter/material.dart';
import 'package:flutter_app/models/OrderItem.dart';
import 'package:flutter_app/value/helper.dart';

class OrderWidget extends StatelessWidget {
  final OrderItem order;
  OrderWidget({Key key, this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Card(
          elevation: 5,
          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          order.order_number.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Container(
                            width: 24,
                            height: 24,
                            child: Image(image: AssetImage('assets/air.png'))),
                        Expanded(
                          child: SizedBox(),
                        ),
                        Text(
                          convertTimedMy(time: order.created_at,originFormat: FORMAT_DATE_YYMMDD_HHMSS,outputFormat: FORMAT_DATE_DOT_DDMM_YYYY),
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
