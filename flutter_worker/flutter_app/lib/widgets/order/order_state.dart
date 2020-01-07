import 'package:equatable/equatable.dart';
import 'package:flutter_app/models/OrderItem.dart';

abstract class OrderState extends Equatable {
  OrderState([List props = const []]) : super(props);
}
class OrderUninitialized extends OrderState {
  @override
  String toString() {
    return 'OrderUninitialized';
  }
}
class OrderError extends OrderState {
  @override
  String toString() {
    return 'OrderError';
  }
}
class OrderLoaded extends OrderState {
  final List<OrderItem> orderItems;
  final bool hasReachMax;
  OrderLoaded({
    this.orderItems,
    this.hasReachMax
  }) : super([orderItems, hasReachMax]);


  OrderLoaded copyWith({
    List<OrderItem> orderItems,
    bool haseachedMax,
  }){
    return OrderLoaded(
      orderItems: orderItems ?? this.orderItems,
      hasReachMax: hasReachMax ?? this.hasReachMax);
  }


  @override
  String toString() {
    // TODO: implement toString
    return 'OrderLoaded { orders: ${orderItems.length}, hasReachedMax: $hasReachMax}';
  }
}