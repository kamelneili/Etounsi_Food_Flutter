import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kamelfoodapp/models/category_filter_model.dart';
import 'package:kamelfoodapp/models/price_filter_model.dart';

class Filter extends Equatable {
  final List<CategoryFilter> categoryFilters;
  final List<PriceFilter> priceFilters;
  const Filter({
    this.categoryFilters = const <CategoryFilter>[],
    this.priceFilters = const <PriceFilter>[],
  });
  @override
  List<Object?> get props => [categoryFilters, priceFilters];

  Filter copyWith({
    final List<CategoryFilter>? categoryFilters,
    final List<PriceFilter>? priceFilters,
  }) {
    return Filter(
        priceFilters: priceFilters ?? this.priceFilters,
        categoryFilters: categoryFilters ?? this.categoryFilters);
  }
}
