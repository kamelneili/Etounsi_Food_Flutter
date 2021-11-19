import 'package:flutter/material.dart';
import 'package:kamelfoodapp/models/restaurant_model.dart';
import 'package:kamelfoodapp/screens/widgets/restaurant_card.dart';

class RestaurantListingScreen extends StatelessWidget {
  final List<Restaurant> restaurants;
  const RestaurantListingScreen({
    Key? key,
    required this.restaurants,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('RestaurantListing')),
        body: ListView.builder(
          itemCount: restaurants.length,
          itemBuilder: (context, index) {
            return RestaurantCard(restaurant: restaurants[index]);
          },
        ));
  }
}

//
