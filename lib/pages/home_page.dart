import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/provider/weather_provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context).weatherData;

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              color: Colors.white,
              icon: const Icon(Icons.search),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SearchPage();
                }));
              },
            ),
          )
        ],
        backgroundColor: Colors.blue,
        title: const Text(
          'Weather App',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: weatherData == null
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'there is no weather 😔 start',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    'searching now 🔍',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  )
                ],
              ),
            )
          : Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(
                    flex: 3,
                  ),
                  Text(
                   Provider.of<WeatherProvider>(context).cityName! ,
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'updated  : 13,23,3',
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image(image: AssetImage(weatherData!.getImage())),
                      Text(
                        '${weatherData!.temp.toInt().toString()} ',
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                      Column(
                        children: [
                          Text('maxtemp : ${weatherData!.maxTemp.toInt()} '),
                          Text('mintemp : ${weatherData!.minTemp.toInt()}'),
                        ],
                      )
                    ],
                  ),
                  Spacer(),
                  Text(
                    weatherData!.weatherStateName.toString(),
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  Spacer(
                    flex: 5,
                  )
                ],
              ),
            ),
    );
  }
}
