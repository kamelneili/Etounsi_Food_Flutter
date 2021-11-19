import 'package:equatable/equatable.dart';
import 'package:kamelfoodapp/models/category_model.dart';
import 'package:kamelfoodapp/models/price_model.dart';

class PriceFilter extends Equatable {
  final int id;
  final bool value;
  final Price price;
  PriceFilter({
    required this.id,
    required this.value,
    required this.price,
  });
  @override
  List<Object?> get props => [id, value, price];
  PriceFilter copyWith({
    int? id,
    Price? price,
    bool? value,
  }) {
    return PriceFilter(
        id: id ?? this.id,
        value: value ?? this.value,
        price: price ?? this.price);
  }

  static List<PriceFilter> filters = Price.prices
      .map((price) => PriceFilter(
            price: price,
            id: price.id,
            value: false,
          ))
      .toList();
}
