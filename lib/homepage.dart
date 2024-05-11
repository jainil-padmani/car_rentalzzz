import 'package:flutter/material.dart';
import 'UserHome.dart';
import 'Profile.dart';

class HomePage extends StatefulWidget {
  final List<Car> cars; // Assuming you have a list of Car
  final List<Car> favoriteCars = [];

  HomePage({required this.cars});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _buildBody(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          selectedItemColor: Colors.black, // Set the color for the selected item
          unselectedItemColor: Colors.black.withOpacity(0.5), // Set the color for unselected items
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    switch (_currentIndex) {
      case 0:
        return Home(); 
      case 1:
        return Profile();
      default:
        return Container();
    }
  }

  Widget _buildList(String title, Color color) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('$title Item $index'),
          tileColor: color.withOpacity(0.2),
        );
      },
    );
  }
}
