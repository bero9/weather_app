import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/services/weather_services.dart';

import 'home_page.dart';

class SearchPage extends StatelessWidget {
  String? cityName;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: Colors.white,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (contxt) {
              return HomePage();
            }));
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text(
          'Search a City',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onSubmitted: (data) async {
              cityName = data;
              WeatherService service = WeatherService();

              WeatherModel weather =
                  await service.getWeather(cityName: cityName!);

              Provider.of<WeatherProvider>(context,listen: false).weatherData =weather;
              Provider.of<WeatherProvider>(context,listen: false).cityName =cityName;
              Navigator.pop(context);

            },
            decoration: const InputDecoration(
              label: Text('search'),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 32, horizontal: 42),
              suffixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
              hintText: 'Enter a City',
            ),
          ),
        ),
      ),
    );
  }
}
