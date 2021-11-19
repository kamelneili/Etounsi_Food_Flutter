import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamelfoodapp/models/restaurant_model.dart';
import 'package:kamelfoodapp/screens/basket/basket_screen.dart';
import 'package:kamelfoodapp/screens/edit_basket/edit_basket_screen.dart';
import 'package:kamelfoodapp/screens/filter/filter_screen.dart';
import 'package:kamelfoodapp/screens/home/home_screen.dart';
import 'package:kamelfoodapp/screens/restaurant_details/restaurant_details_screen.dart';
import 'package:kamelfoodapp/screens/restaurant_listing/restaurant_listing_screen.dart';
import 'package:kamelfoodapp/screens/voucher/voucher_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
        );
      case '/filter':
        return MaterialPageRoute(
          builder: (_) => FilterScreen(),
        );
      case '/voucher':
        return MaterialPageRoute(
          builder: (_) => VoucherScreen(),
        );
      case '/basket':
        return MaterialPageRoute(
          builder: (_) => BasketScreen(),
        );

      case '/edit_basket':
        return MaterialPageRoute(
          builder: (_) => EditBasketScreen(),
        );

      case '/details_restaurant':
        return MaterialPageRoute(
          builder: (_) =>
              RestaurantDetails(restaurant: settings.arguments as Restaurant),
        );

      case '/restaurant-listing':
        return MaterialPageRoute(
          builder: (_) => RestaurantListingScreen(
              restaurants: settings.arguments as List<Restaurant>),
        );
    }
  }
}
