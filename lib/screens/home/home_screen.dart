import 'package:flutter/material.dart';
import 'package:kamelfoodapp/models/category_model.dart';
import 'package:kamelfoodapp/models/promo_model.dart';
import 'package:kamelfoodapp/models/restaurant_model.dart';
import 'package:kamelfoodapp/screens/widgets/category_box.dart';
import 'package:kamelfoodapp/screens/widgets/custom_navbar.dart';
import 'package:kamelfoodapp/screens/widgets/food_search_box.dart';
import 'package:kamelfoodapp/screens/widgets/promo_box.dart';
import 'package:kamelfoodapp/screens/widgets/restaurant_card.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      bottomNavigationBar: CustomNavBar(),
      body: SingleChildScrollView(
          child: Column(
        //   mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: Category.categories.length,
                  itemBuilder: (context, index) {
                    return CategoryBox(category: Category.categories[index]);
                  },
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
                height: 125,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: Promo.promos.length,
                  itemBuilder: (context, index) {
                    return PromoBox(promo: Promo.promos[index]);
                  },
                )),
          ),
          FoodSearchBox(),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text('Top Rated'),
              )),
          Container(
            height: 300,
            child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(), // new

                shrinkWrap: true,
                itemCount: Restaurant.restaurants.length,
                itemBuilder: (context, index) {
                  print(Restaurant.restaurants.length);

                  return RestaurantCard(
                      restaurant: Restaurant.restaurants[index]);
                }),
          )
        ],
      )),
    );
  }
}

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        leading: IconButton(
          icon: Icon(Icons.person),
          onPressed: () {},
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Current Location'),
            Text('Tunis,Center'),
          ],
        ));
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50.0);
}
