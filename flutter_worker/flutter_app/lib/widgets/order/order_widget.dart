import 'package:flutter/material.dart';
import 'package:flutter_app/models/OrderItem.dart';

class OrderWidget extends StatelessWidget {
  final OrderItem order;
  OrderWidget({Key key, this.order}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return Material(
          child: ListTile(
        title: Text(order.id.toString()),
        isThreeLine: true,
        subtitle: Text('order status'),
        dense: true,
      ),
    );
  }
}