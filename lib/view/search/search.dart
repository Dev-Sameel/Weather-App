import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/weather_controller.dart';

class SearchView extends StatelessWidget {
  final WeatherController weatherController = Get.find();
  final TextEditingController cityController = TextEditingController();

  // List of predefined locations
  final List<String> predefinedLocations = [
    'New York',
    'Los Angeles',
    'London',
    'Paris',
    'Tokyo',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search City Weather'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: cityController,
              decoration: InputDecoration(
                labelText: 'City Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: null,
              hint: Text('Select a predefined location'),
              items: predefinedLocations
                  .map((location) => DropdownMenuItem<String>(
                        value: location,
                        child: Text(location),
                      ))
                  .toList(),
              onChanged: (selectedLocation) {
                cityController.text = selectedLocation ?? '';
              },
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                weatherController
                    .fetchWeatherByCityName(cityController.text.trim());
                Get.back();
              },
              child: Text('Search'),
            ),
          ],
        ),
      ),
    );
  }
}
