import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        color: Colors.black,
        child: Container(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.home, color: Colors.white)),
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/cart');
                    },
                    icon: Icon(Icons.shopping_basket, color: Colors.white)),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.person, color: Colors.white))
              ],
            )));
  }
}
