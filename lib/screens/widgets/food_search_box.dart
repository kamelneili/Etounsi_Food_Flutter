import 'package:flutter/material.dart';

class FoodSearchBox extends StatelessWidget {
  const FoodSearchBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'What would you like to eat',
                suffixIcon: Icon(Icons.search, color: Colors.red),
              ),
            ),
          ),
          SizedBox(width: 10),
          Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0)),
              child: IconButton(
                icon: Icon(Icons.menu, color: Colors.red),
                onPressed: () {
                   Navigator.of(context).pushNamed(
                        '/filter',
                       
                      );
                },
              ))
        ],
      ),
    );
  }
}
