import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Category extends Equatable {
  final int id;
  final String name;
  final Image image;
  Category({
    required this.id,
    required this.name,
    required this.image,
  });
  @override
  List<Object?> get props => [id, name, image];
  static List<Category> categories = [
    Category(
      id: 1,
      name: 'Pizza',
      image: Image.asset('assets/pizza.png'),
    ),
    Category(
      id: 2,
      name: 'Burger',
      image: Image.asset('assets/burger.png'),
    ),
    Category(
      id: 3,
      name: 'Salad',
      image: Image.asset('assets/salad.png'),
    ),
    Category(
      id: 4,
      name: 'Desser',
      image: Image.asset('assets/desser.png'),
    ),
    Category(
      id: 5,
      name: 'Drink',
      image: Image.asset('assets/drink.png'),
    ),
  ];
}
