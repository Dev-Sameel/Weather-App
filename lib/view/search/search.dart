import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/model/constants/color.dart';
import 'package:weather/model/constants/size.dart';
import '../../controller/weather_controller.dart';

class SearchView extends StatelessWidget {
  final WeatherController weatherController = Get.find();
  final TextEditingController cityController = TextEditingController();

  // List of predefined locations
  final List<String> predefinedLocations = [
    'China',
    'New York',
    'Russia',
    'London',
    'Paris',
    'Tokyo',
  ];

  SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: CColors.kBlack,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(74, 140, 136, 1),
        iconTheme: const IconThemeData(color: CColors.kWhite),
        title: const Text('Search City Weather',
            style: TextStyle(color: CColors.kWhite)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.all(CSize.md),
            padding: const EdgeInsets.all(CSize.md),
            decoration: BoxDecoration(
                border:
                    Border.all(color: const Color.fromRGBO(218, 200, 176, 1)),
                borderRadius: BorderRadius.circular(CSize.lg)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButtonFormField<String>(
                  dropdownColor: const Color.fromRGBO(49, 100, 104, 1),
                  iconEnabledColor: CColors.kWhite,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  value: null,
                  hint: const Text(
                    'Select a custom location',
                    style: TextStyle(color: CColors.kWhite),
                  ),
                  items: predefinedLocations
                      .map((location) => DropdownMenuItem<String>(
                            alignment: Alignment.center,
                            value: location,
                            child: Text(location,
                                style: const TextStyle(color: CColors.kWhite)),
                          ))
                      .toList(),
                  onChanged: (selectedLocation) {
                    cityController.text = selectedLocation ?? '';
                  },
                ),
                const SizedBox(
                  height: CSize.spaceBtwItems,
                ),
                TextFormField(
                  style: const TextStyle(color: CColors.kWhite),
                  controller: cityController,
                  decoration: InputDecoration(
                    labelText: 'City Name',
                    labelStyle: const TextStyle(color: CColors.kWhite),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(218, 200, 176, 1)),
                        borderRadius: BorderRadius.circular(CSize.lg)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(218, 200, 176, 1)),
                        borderRadius: BorderRadius.circular(CSize.lg)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(CSize.lg),
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(218, 200, 176, 1))),
                  ),
                ),
                const SizedBox(height: CSize.spaceBtwSections),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(74, 140, 136, 1)),
                  onPressed: () {
                    weatherController
                        .fetchWeatherByCityName(cityController.text.trim());
                    Get.back();
                  },
                  child: const Text(
                    'Search',
                    style: TextStyle(
                        color: CColors.kWhite, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          const Image(image: AssetImage('assets/images/cityImage.png'))
        ],
      ),
    );
  }
}
