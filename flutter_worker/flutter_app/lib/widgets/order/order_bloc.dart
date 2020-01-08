import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:rxdart/rxdart.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/OrderItem.dart';
import 'package:flutter_app/value/const.dart';
import 'package:flutter_app/widgets/order/order_event.dart';
import 'package:flutter_app/widgets/order/order_state.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final http.Client httpClient;
  OrderBloc({ @required  this.httpClient});

  @override
  OrderState get initialState => OrderUninitialized();

  @override
  Stream<OrderState> transform(
    Stream<OrderEvent> events,
    Stream<OrderState> Function(OrderEvent event) next) {
    // TODO: implement transform
    return super.transform(
      (events as Observable<OrderEvent>).debounceTime(
        Duration(microseconds: 500),)
      , next);
  }

  @override
  Stream<OrderState> mapEventToState(OrderEvent event) async* {
    if (event is Fetch && !_hasReachedMax(currentState)){
      try {
        if (currentState is OrderUninitialized){
          final orderItems = await _fetchOrders(0, 20);
          yield OrderLoaded(orderItems: orderItems, hasReachMax: false);
        }
        if (currentState is OrderLoaded) {
          final orderItems = await _fetchOrders((currentState as OrderLoaded).orderItems.length, 20);
          yield orderItems.isEmpty
                ? (currentState as OrderLoaded).copyWith(haseachedMax: true)
                : OrderLoaded(
                  orderItems: (currentState as OrderLoaded).orderItems + orderItems,
                  hasReachMax: false
                );
        } 
      } catch (e){
          yield OrderError();
      }
    }
  }

  bool _hasReachedMax(OrderState state) =>
      state is OrderLoaded && state.hasReachMax;

  Future<List<OrderItem>> _fetchOrders(int page, int limit) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString(TOKEN) ?? "";

    final response = await httpClient.get(
        BASE_URL_DATA_WORKER + '/api/orders?limit=$limit&page=$page',
        headers: {
          "Content-Type": "application/json",
          HttpHeaders.authorizationHeader: "Bearer " + token
        });

        log('order, ${response.body}');

    if (response.statusCode == 200){
      final data = json.decode(response.body);
      var dataItems = data['data']['items'] as List;
      return dataItems.map((it){
          return OrderItem.fromMap(it);
      }
      ).toList();
    } else {
      throw Exception('error fetching posts');
    }
  }
}
