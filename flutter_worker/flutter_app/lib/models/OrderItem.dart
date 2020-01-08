import 'dart:convert';

import 'package:equatable/equatable.dart';

class OrderItem extends Equatable {
  final int id;
  final String order_number;
  final String order_type;
  final String order_issue_date;
  final String order_status;
  final int service_category_id;
  final int contract_id;
  final int final_total_amount;
  final int total_tax_amount;
  final int total_discount_amount;
  final String created_at;
  final String updated_at;
  final String service_location;
  OrderItem({
    this.id,
    this.order_number,
    this.order_type,
    this.order_issue_date,
    this.order_status,
    this.service_category_id,
    this.contract_id,
    this.final_total_amount,
    this.total_tax_amount,
    this.total_discount_amount,
    this.created_at,
    this.updated_at,
    this.service_location,
  }) : super([id,order_number,order_issue_date,order_status,
              service_category_id,final_total_amount,total_tax_amount,
              total_discount_amount,created_at,updated_at,service_location]);

  OrderItem copyWith({
    int id,
    String order_number,
    String order_type,
    String order_issue_date,
    String order_status,
    int service_category_id,
    int contract_id,
    int final_total_amount,
    int total_tax_amount,
    int total_discount_amount,
    String created_at,
    String updated_at,
    String service_location,
  }) {
    return OrderItem(
      id: id ?? this.id,
      order_number: order_number ?? this.order_number,
      order_type: order_type ?? this.order_type,
      order_issue_date: order_issue_date ?? this.order_issue_date,
      order_status: order_status ?? this.order_status,
      service_category_id: service_category_id ?? this.service_category_id,
      contract_id: contract_id ?? this.contract_id,
      final_total_amount: final_total_amount ?? this.final_total_amount,
      total_tax_amount: total_tax_amount ?? this.total_tax_amount,
      total_discount_amount: total_discount_amount ?? this.total_discount_amount,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      service_location: service_location ?? this.service_location,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'order_number': order_number,
      'order_type': order_type,
      'order_issue_date': order_issue_date,
      'order_status': order_status,
      'service_category_id': service_category_id,
      'contract_id': contract_id,
      'final_total_amount': final_total_amount,
      'total_tax_amount': total_tax_amount,
      'total_discount_amount': total_discount_amount,
      'created_at': created_at,
      'updated_at': updated_at,
      'service_location': service_location,
    };
  }

  static OrderItem fromMap(Map<String, dynamic> map) {
    // if (map == null) return null;
  
    return OrderItem(
      id: map['id']?.toInt(),
      order_number: map['order_number'],
      order_type: map['order_type'],
      order_issue_date: map['order_issue_date'],
      order_status: map['order_status'],
      service_category_id: map['service_category_id']?.toInt(),
      contract_id: map['contract_id']?.toInt(),
      final_total_amount: map['final_total_amount']?.toInt(),
      total_tax_amount: map['total_tax_amount']?.toInt(),
      total_discount_amount: map['total_discount_amount']?.toInt(),
      created_at: map['created_at'],
      updated_at: map['updated_at'],
      service_location: map['service_location'],
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderItem.fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'OrderItem id: $id, order_number: $order_number, order_type: $order_type, order_issue_date: $order_issue_date, order_status: $order_status, service_category_id: $service_category_id, contract_id: $contract_id, final_total_amount: $final_total_amount, total_tax_amount: $total_tax_amount, total_discount_amount: $total_discount_amount, created_at: $created_at, updated_at: $updated_at, service_location: $service_location';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is OrderItem &&
      o.id == id &&
      o.order_number == order_number &&
      o.order_type == order_type &&
      o.order_issue_date == order_issue_date &&
      o.order_status == order_status &&
      o.service_category_id == service_category_id &&
      o.contract_id == contract_id &&
      o.final_total_amount == final_total_amount &&
      o.total_tax_amount == total_tax_amount &&
      o.total_discount_amount == total_discount_amount &&
      o.created_at == created_at &&
      o.updated_at == updated_at &&
      o.service_location == service_location;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      order_number.hashCode ^
      order_type.hashCode ^
      order_issue_date.hashCode ^
      order_status.hashCode ^
      service_category_id.hashCode ^
      contract_id.hashCode ^
      final_total_amount.hashCode ^
      total_tax_amount.hashCode ^
      total_discount_amount.hashCode ^
      created_at.hashCode ^
      updated_at.hashCode ^
      service_location.hashCode;
  }
}