import 'dart:convert';

import 'package:flutter_app/models/OrderItem.dart';
import 'package:http/http.dart';

class BaseResponse<T> {
  Data data;
  int status;
  BaseResponse(
    this.data,
    this.status,
  );
 
  BaseResponse.fromJson(Map<String, dynamic> json) : data = json['data'], status = json['status'];

  BaseResponse copyWith({
    Data<T> data,
    int status,
  }) {
    return BaseResponse(
      data ?? this.data,
      status ?? this.status,
    );
  }


  @override
  String toString() => 'BaseResponse data: $data, status: $status';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is BaseResponse &&
      o.data == data &&
      o.status == status;
  }

  @override
  int get hashCode => data.hashCode ^ status.hashCode;
}


class Data<T> {
   List<OrderItem> items;
   int total;
  Data(
    this.items,
    this.total,
  );

  Data.fromJson(Map<String, dynamic> json) : items  = json['items'], total = json['total'];

  Data copyWith({
    List<T> items,
    int total,
  }) {
    return Data(
      items ?? this.items,
      total ?? this.total,
    );
  }

  @override
  String toString() => 'Data items: $items, total: $total';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Data &&
      o.items == items &&
      o.total == total;
  }

  @override
  int get hashCode => items.hashCode ^ total.hashCode;
 }