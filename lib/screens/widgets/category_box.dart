import 'package:flutter/material.dart';
import 'package:kamelfoodapp/models/category_model.dart';
import 'package:kamelfoodapp/models/restaurant_model.dart';

class CategoryBox extends StatelessWidget {
  final Category category;

  const CategoryBox({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Restaurant> restaurants = Restaurant.restaurants
        .where(
          (restaurant) => restaurant.tags.contains(category.name),
        )
        .toList();
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/restaurant-listing',
            arguments: restaurants);
      },
      child: Container(
          width: 80,
          margin: const EdgeInsets.only(right: 5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  height: 50,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: category.image,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    category.name,
                  ),
                ),
              )
            ],
          )),
    );
  }
}
