import 'package:flutter/material.dart';
import 'package:flutter_app/models/OrderItem.dart';

class OrderWidget extends StatelessWidget {
  final OrderItem order;
  OrderWidget({Key key, this.order}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return Material(
          child: ListTile(
        leading: Text(
          order.id.toString(),
          style: TextStyle(fontSize: 10.0),
        ),
        title: Text('${order.order_type}'),
        isThreeLine: true,
        subtitle: Text(order.order_status),
        dense: true,
      ),
    );
  }
}