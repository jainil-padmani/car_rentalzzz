// main.dart

// ignore_for_file: unnecessary_null_comparison

import 'dart:io';

import 'package:car_rentalzzz/favourite.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class Car {
  String name;
  double price;
  String description;
  String assetPath;

  Car(this.name, this.price, {required this.description, required this.assetPath});
}

class _HomeState extends State<Home> {
  List<Car> cars = [
    Car('Hyundai I20', 1200.0, description: 'I20 car with PETROL', assetPath: 'assets/images/INTRO.png'),
    Car('Suzuki Baleno', 1200.0, description: 'Baleno with PETROL', assetPath: 'assets/images/INTRO.png'),
    Car('Suzuki Celerio', 800.0, description: 'Celerio with PETROL and CNG', assetPath: 'assets/images/INTRO.png'),
  ];

  List<Car> favoriteCars = [];

  List<Car> filteredCars = [];

  @override
  void initState() {
    super.initState();
    filteredCars = cars;
  }

  void _onSearch(String query) {
    setState(() {
      filteredCars = cars
          .where((car) =>
              car.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Rental'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              String? query = await showSearch(
                context: context,
                delegate: CarSearchDelegate(cars),
              );

              if (query != null && query.isNotEmpty) {
                _onSearch(query);
              }
            },
          ),
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      FavoriteCarsPage(favoriteCars: favoriteCars),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: filteredCars.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 5,
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CarDetailsPage(
                          car: filteredCars[index],
                          onFavoriteChanged: (isFavorite) {
                            setState(() {
                              if (isFavorite) {
                                favoriteCars.add(filteredCars[index]);
                              } else {
                                favoriteCars.remove(filteredCars[index]);
                              }
                            });
                          }),
                    ),
                  );
                },
                leading: CircleAvatar(
                  radius: 25,
                  backgroundImage: filteredCars[index].assetPath != null
                      ? FileImage(File(filteredCars[index].assetPath))
                      : null,
                  child: filteredCars[index].assetPath == null
                      ? Icon(Icons.directions_car)
                      : null,
                ),
                title: Text(filteredCars[index].name),
                subtitle:
                    Text('₹ ${filteredCars[index].price.toString()} per day'),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddCarPage(initialDescription: ''),
            ),
          );

          if (result != null) {
            setState(() {
              cars.add(result);
              filteredCars = cars; // Update filteredCars as well
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class AddCarPage extends StatefulWidget {
  final String initialDescription;

  AddCarPage({required this.initialDescription});

  @override
  _AddCarPageState createState() => _AddCarPageState();
}

class _AddCarPageState extends State<AddCarPage> {
  TextEditingController carController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  File? _image;

  Future getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  Future<void> _editDescription(BuildContext context, Car car) async {
    String? editedDescription = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Description'),
          content: TextField(
            controller: TextEditingController(text: car.description),
            maxLines: 3,
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context, null);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, car.description);
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );

    if (editedDescription != null) {
      setState(() {
        car.description = editedDescription;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Car'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: getImage,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: _image != null ? FileImage(_image!) : null,
                child: _image == null
                    ? Icon(
                        Icons.camera_alt,
                        size: 40,
                      )
                    : null,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: carController,
              decoration: InputDecoration(labelText: 'Car Name'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Price per day (₹)'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
                hintText: widget.initialDescription,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_image != null) {
                  Navigator.pop(
                    context,
                    Car(
                      carController.text,
                      double.parse(priceController.text),
                      description: descriptionController.text,
                      assetPath: _image!.path,
                    ),
                  );
                }
              },
              child: Text('Add Car'),
            ),
          ],
        ),
      ),
    );
  }
}

class CarDetailsPage extends StatefulWidget {
  final Car car;
  final Function(bool) onFavoriteChanged;

  const CarDetailsPage({Key? key, required this.car, required this.onFavoriteChanged}) : super(key: key);

  @override
  _CarDetailsPageState createState() => _CarDetailsPageState();
}

class _CarDetailsPageState extends State<CarDetailsPage> {
  DateTime? pickupDate;
  DateTime? dropDate;
  double totalAmount = 0.0;
  bool isFavorite = false;

  void calculateTotalAmount() {
    if (pickupDate != null && dropDate != null) {
      int days = dropDate!.difference(pickupDate!).inDays;
      totalAmount = days * widget.car.price;
    } else {
      totalAmount = 0.0;
    }
  }

  Future<void> _selectDate(BuildContext context, bool isPickupDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );

    if (picked != null && picked != (isPickupDate ? dropDate : pickupDate)) {
      setState(() {
        if (isPickupDate) {
          pickupDate = picked;
        } else {
          dropDate = picked;
        }
        calculateTotalAmount();
      });
    }
  }


  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Booking Confirmation'),
          content: Text(
            pickupDate != null && dropDate != null && totalAmount > 0
                ? 'Booking Confirmed! Total Amount: ₹$totalAmount'
                : 'Please select pickup and drop dates.',
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.car.name),
        actions: [
          IconButton(
            icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
                widget.onFavoriteChanged(isFavorite);
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Use FileImage instead of Image.asset
              CircleAvatar(
                radius: 50,
                backgroundImage: widget.car.assetPath != null
                    ? FileImage(File(widget.car.assetPath))
                    : null,
              ),
              SizedBox(height: 16),
              Text(
                'Car Name: ${widget.car.name}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('Price per Day: ₹${widget.car.price.toString()}'),
              SizedBox(height: 8),
              Text('Description: ${widget.car.description.toString()}'),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  _selectDate(context, true);
                },
                child: Text('Select Pickup Date'),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  _selectDate(context, false);
                },
                child: Text('Select Drop Date'),
              ),
              SizedBox(height: 16),
              Text('Total Amount: ₹$totalAmount'),
              SizedBox(height: 16),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (pickupDate != null && dropDate != null && totalAmount > 0) {
                    _showConfirmationDialog(); // Show confirmation dialog
                  } else {
                    _showConfirmationDialog(); // Show error dialog
                  }
                },
                child: Text('Book Car'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class CarSearchDelegate extends SearchDelegate<String> {
  final List<Car> cars;

  CarSearchDelegate(this.cars);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildSearchResults();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildSearchResults();
  }

  Widget _buildSearchResults() {
    final results = cars
        .where((car) => car.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(results[index].name),
          onTap: () {
            close(context, results[index].name);
          },
        );
      },
    );
  }
}