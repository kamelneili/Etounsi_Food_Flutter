import 'package:flutter/material.dart';
import 'package:kamelfoodapp/models/restaurant_model.dart';
import 'package:kamelfoodapp/screens/widgets/restaurant_tags.dart';

class RestaurantInformation extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantInformation({Key? key, required this.restaurant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(restaurant.name,
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    color: Theme.of(context).accentColor,
                  )),
          SizedBox(
            height: 10,
          ),
          RestaurantTags(restaurant: restaurant),
          SizedBox(
            height: 5,
          ),
          Text('${restaurant.distance}km away -\$${restaurant.deliveryFee}'),
          SizedBox(
            height: 10,
          ),
          Text('Restaurant Information'),
          SizedBox(height: 5),
          Text(
              'Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet,'),
        ],
      ),
    );
  }
}
