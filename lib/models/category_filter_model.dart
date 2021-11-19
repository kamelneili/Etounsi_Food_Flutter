import 'package:equatable/equatable.dart';
import 'package:kamelfoodapp/models/category_model.dart';

class CategoryFilter extends Equatable {
  final int id;
  final bool value;
  final Category category;
  CategoryFilter({
    required this.id,
    required this.value,
    required this.category,
  });
  @override
  List<Object?> get props => [id, value, category];
  static List<Category> categories = [];
  CategoryFilter copyWith({
    int? id,
    Category? category,
    bool? value,
  }) {
    return CategoryFilter(
        id: id ?? this.id,
        value: value ?? this.value,
        category: category ?? this.category);
  }

  static List<CategoryFilter> filters = Category.categories
      .map((category) => CategoryFilter(
            category: category,
            id: category.id,
            value: false,
          ))
      .toList();
}
