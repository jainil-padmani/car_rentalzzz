import 'package:car_rentalzzz/UserHome.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  final List<Car> cars;

  SearchPage({required this.cars});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();
  List<Car> searchResults = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Cars'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: 'Search Cars',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    performSearch();
                  },
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: searchResults.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CarDetailsPage(car: searchResults[index], onFavoriteChanged: (bool ) {  },),
                          ),
                        );
                      },
                      title: Text(searchResults[index].name),
                      subtitle: Text('₹ ${searchResults[index].price.toString()} per day'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

void performSearch() {
  String query = searchController.text.toLowerCase();
  print('Searching for: $query');
  
  setState(() {
    searchResults = widget.cars
        .where((car) =>
            car.name.toLowerCase().contains(query) ||
            car.description.toLowerCase().contains(query) ||
            car.name.split(' ').any((part) => part.contains(query)) ||
            car.description.split(' ').any((part) => part.contains(query)))
        .toList();
  });

  print('Search Results: $searchResults');
}
}
