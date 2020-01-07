import 'package:equatable/equatable.dart';

abstract class OrderEvent extends Equatable{}

class Fetch extends OrderEvent{
  @override
  String toString() {
    return 'Fetch';
  }
}