import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Price extends Equatable {
  final int id;
  final String price;
  Price({
    required this.id,
    required this.price,
  });
  @override
  List<Object?> get props => [id, price];
  static List<Price> prices = [
    Price(id: 1, price: '\$'),
    Price(id: 2, price: '\$\$'),
    Price(id: 1, price: '\$\$\$'),
  ];
}
