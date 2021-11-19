import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kamelfoodapp/models/menu_item_model.dart';

class Restaurant extends Equatable {
  final int id;
  final String name;
  final String priceCategory;
  final String imageUrl;
  final List<String> tags;
  final List<MenuItem> menuItems;
  final int deliveryTime;
  final double deliveryFee;
  final double distance;
  Restaurant(
      {required this.id,
      required this.name,
      required this.menuItems,
      required this.imageUrl,
      required this.tags,
      required this.deliveryTime,
      required this.priceCategory,
      required this.deliveryFee,
      required this.distance});
  @override
  List<Object?> get props => [
        id,
        name,
        imageUrl,
        tags,
        deliveryFee,
        deliveryTime,
        priceCategory,
        distance,
        menuItems
      ];
  static List<Restaurant> restaurants = [
    Restaurant(
        id: 1,
        name: ' Couscous',
        imageUrl:
            'https://media.istockphoto.com/photos/vegetable-tagine-with-almond-and-chickpea-couscous-picture-id1173371793', //  tags: ['Italian', 'Dessert', 'Ice Cream'],
        tags: MenuItem.menuItems
            .where((menuItem) => menuItem.restaurantId == 1)
            .map((menuItem) => menuItem.category)
            .toSet()
            .toList(),
        menuItems: MenuItem.menuItems
            .where((menuItem) => menuItem.restaurantId == 1)
            .toList(),
        deliveryFee: 2.99,
        priceCategory: '\$',
        deliveryTime: 30,
        distance: 0.1),
    Restaurant(
        id: 2,
        name: 'cream Ice Gelato Artigianale',
        imageUrl:
            'https://images.unsplash.com/photo-1466978913421-dad2ebd01d17?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cmVzdGF1cmFudHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60', // tags: ['Italian', 'Dessert', 'Ice Cream'],
        tags: MenuItem.menuItems
            .where((menuItem) => menuItem.restaurantId == 2)
            .map((menuItem) => menuItem.category)
            .toSet()
            .toList(),
        menuItems: MenuItem.menuItems
            .where((menuItem) => menuItem.restaurantId == 2)
            .toList(),
        deliveryFee: 2.99,
        priceCategory: '\$',
        deliveryTime: 30,
        distance: 0.1),
    Restaurant(
        id: 3,
        name: ' Ice Gelato Artigianale',
        imageUrl:
            'https://images.unsplash.com/photo-1502301103665-0b95cc738daf?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fHJlc3RhdXJhbnR8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60', // tags: ['Italian', 'Dessert', 'Ice Cream'],
        tags: MenuItem.menuItems
            .where((menuItem) => menuItem.restaurantId == 3)
            .map((menuItem) => menuItem.category)
            .toSet()
            .toList(),
        menuItems: MenuItem.menuItems
            .where((menuItem) => menuItem.restaurantId == 3)
            .toList(),
        deliveryFee: 2.99,
        priceCategory: '\$',
        deliveryTime: 30,
        distance: 0.1),
    Restaurant(
        id: 4,
        name: 'Golden Ice Gelato Artigianale',
        imageUrl:
            'https://images.unsplash.com/photo-1498654896293-37aacf113fd9?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fHJlc3RhdXJhbnR8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60', // tags: ['Italian', 'Dessert', 'Ice Cream'],
        tags: MenuItem.menuItems
            .where((menuItem) => menuItem.restaurantId == 4)
            .map((menuItem) => menuItem.category)
            .toSet()
            .toList(),
        menuItems: MenuItem.menuItems
            .where((menuItem) => menuItem.restaurantId == 4)
            .toList(),
        deliveryFee: 2.99,
        priceCategory: '\$',
        deliveryTime: 30,
        distance: 0.1),
  ];
}
