import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamelfoodapp/blocs/basket/basket_bloc.dart';
import 'package:kamelfoodapp/models/menu_item_model.dart';
import 'package:kamelfoodapp/models/restaurant_model.dart';
import 'package:kamelfoodapp/screens/widgets/restaurant_information.dart';

class RestaurantDetails extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantDetails({Key? key, required this.restaurant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  Restaurant restaurant = Restaurant.restaurants[0];
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).accentColor,
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/basket');
                },
                child: Text("Basket"),
              )
            ],
          )),
        ),
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  bottom:
                      Radius.elliptical(MediaQuery.of(context).size.width, 50),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    restaurant.imageUrl,
                  ),
                ),
              ),
            ),
            RestaurantInformation(restaurant: restaurant),
            ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: restaurant.tags.length,
                itemBuilder: (context, index) {
                  return _buildMenuItems(restaurant, context, index);
                }),
          ],
        )));
  }

  Widget _buildMenuItems(
      Restaurant restaurant, BuildContext context, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
          child: Text(restaurant.tags[index],
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    color: Theme.of(context).accentColor,
                  )),
        ),
        //** */
        Column(
          children: restaurant.menuItems
              .where((menuItem) => menuItem.category == restaurant.tags[index])
              .map(
                (menuItem) => Column(
                  children: [
                    Container(
                      color: Colors.white,
                      //  padding: EdgeInsets.symmetric(horizontal: 20),
                      child: ListTile(
                        dense: true,
                        title: Text(menuItem.name),
                        subtitle: Text(menuItem.description),
                        trailing: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('\$${menuItem.price}'),
                            BlocBuilder<BasketBloc, BasketState>(
                              builder: (context, state) {
                                return IconButton(
                                    onPressed: () {
                                      context.read<BasketBloc>()
                                        ..add(AddItem(menuItem));
                                    },
                                    icon: Icon(Icons.add_circle),
                                    color: Colors.redAccent);
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      height: 2,
                    )
                  ],
                ),
              )
              .toList(),
        )
        //** */
      ],
    );
  }
}
