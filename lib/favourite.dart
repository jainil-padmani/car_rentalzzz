// favorite_cars_page.dart

import 'package:car_rentalzzz/UserHome.dart';
import 'package:flutter/material.dart';

class FavoriteCarsPage extends StatelessWidget {
  final List<Car> favoriteCars;

  const FavoriteCarsPage({Key? key, required this.favoriteCars}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Cars'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: favoriteCars.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 5,
              child: ListTile(
                // Similar to how you display cars in the main page
                title: Text(favoriteCars[index].name),
                subtitle: Text('₹ ${favoriteCars[index].price.toString()} per day'),
              ),
            );
          },
        ),
      ),
    );
  }
}
