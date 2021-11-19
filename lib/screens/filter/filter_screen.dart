import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamelfoodapp/blocs/filters/filters_bloc.dart';
import 'package:kamelfoodapp/blocs/filters/filters_state.dart';
import 'package:kamelfoodapp/models/category_model.dart';
import 'package:kamelfoodapp/models/price_model.dart';
import 'package:kamelfoodapp/models/restaurant_model.dart';
import 'package:kamelfoodapp/screens/widgets/custom_category_filter.dart';
import 'package:kamelfoodapp/screens/widgets/custom_price_filter.dart';

class FilterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var category = Category;
    return Scaffold(
        appBar: AppBar(title: Text('Filter')),
        bottomNavigationBar: BottomAppBar(
          child: Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<FiltersBloc, FiltersState>(builder: (context, state) {
                if (state is FiltersLoading)
                  return Center(child: CircularProgressIndicator());
                else if (state is FiltersLoaded) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).accentColor,
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                    ),
                    onPressed: () {
                      var categories = state.filter.categoryFilters
                          .where((filter) => filter.value)
                          .map((filter) => filter.category.name)
                          .toList();
                      var prices = state.filter.priceFilters
                          .where((filter) => filter.value)
                          .map((filter) => filter.price.price)
                          .toList();
                      List<Restaurant> restaurants = Restaurant.restaurants
                          .where(
                            (restaurant) => categories.any(
                              (category) => restaurant.tags.contains(category),
                            ),
                          )
                          .where(
                            (restaurant) => prices.any(
                              (price) =>
                                  restaurant.priceCategory.contains(price),
                            ),
                          )
                          .toList();
                      // Navigator.pushNamed(context, '/restaurant-listing',
                      //    arguments: restaurants);
                      Navigator.of(context).pushNamed(
                        '/restaurant-listing',
                        arguments: restaurants,
                      );
                    },
                    child: Text("Apply"),
                  );
                } else
                  return Text('something went wrong');
              })
            ],
          )),
        ),
        body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Price',
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Theme.of(context).accentColor,
                      ),
                ),
                CustomPriceFilter(),
                Text(
                  'Category',
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Theme.of(context).accentColor,
                      ),
                ),
                CustomCategoryFilter(categories: Category.categories),
              ],
            )));

    //

    //
  }
}
