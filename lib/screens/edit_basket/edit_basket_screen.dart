import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kamelfoodapp/blocs/basket/basket_bloc.dart';

class EditBasketScreen extends StatelessWidget {
  const EditBasketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          elevation: 0,
          title: Text('Edit Basket'),
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
                  Navigator.pop(context);
                },
                child: Text("Done"),
              )
            ],
          )),
        ),
        //*
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Cutlery'),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(color: Colors.white),
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  children: [
                    Expanded(child: Text('Do you need cutlery')),
                    BlocBuilder<BasketBloc, BasketState>(
                      builder: (context, state) {
                        if (state is BasketLoading)
                          return Center(child: CircularProgressIndicator());
                        else if (state is BasketLoaded) {
                          return SizedBox(
                              width: 100,
                              child: SwitchListTile(
                                dense: false,
                                value: state.basket.cutlery,
                                onChanged: (bool? nawvalue) {
                                  context.read<BasketBloc>()
                                    ..add(ToggleSwitch());
                                },
                              ));
                        } else
                          return Text("something went wrong");
                      },
                    )
                  ],
                ),
              ),
              Text('Items'),
              BlocBuilder<BasketBloc, BasketState>(builder: (context, state) {
                if (state is BasketLoading)
                  return Center(child: CircularProgressIndicator());
                else if (state is BasketLoaded) {
                  return state.basket.items.length == 0
                      ? Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(top: 5),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            children: [
                              Text("No items in the basket!!"),
                            ],
                          ))
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.basket
                              .itemQuantity(state.basket.items)
                              .keys
                              .length,
                          itemBuilder: (context, index) {
                            return Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              decoration: BoxDecoration(color: Colors.white),
                              margin: const EdgeInsets.only(top: 5),
                              child: Row(
                                children: [
                                  Text(
                                      '${state.basket.itemQuantity(state.basket.items).entries.elementAt(index).value}X',
                                      style: TextStyle(color: Colors.red)),
                                  SizedBox(width: 20),
                                  Expanded(
                                      child: Text(
                                          '${state.basket.itemQuantity(state.basket.items).keys.elementAt(index).name}')),
                                  IconButton(
                                      visualDensity: VisualDensity.compact,
                                      onPressed: () {
                                        context.read<BasketBloc>()
                                          ..add(RemoveAllItem(state.basket
                                              .itemQuantity(state.basket.items)
                                              .keys
                                              .elementAt(index)));
                                      },
                                      icon: Icon(Icons.delete)),
                                  IconButton(
                                      visualDensity: VisualDensity.compact,
                                      onPressed: () {
                                        context.read<BasketBloc>()
                                          ..add(RemoveItem(state.basket
                                              .itemQuantity(state.basket.items)
                                              .keys
                                              .elementAt(index)));
                                      },
                                      icon: Icon(Icons.remove_circle)),
                                  IconButton(
                                      visualDensity: VisualDensity.compact,
                                      onPressed: () {
                                        context.read<BasketBloc>()
                                          ..add(AddItem(state.basket
                                              .itemQuantity(state.basket.items)
                                              .keys
                                              .elementAt(index)));
                                      },
                                      icon: Icon(Icons.add_circle))
                                ],
                              ),
                            );
                          });
                } else
                  return Text("something went wrong");
              }),
              //*
            ],
          ),
        ));
  }
}
