class WeatherModel {
  String date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherStateName;

  WeatherModel(
      {required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherStateName});

  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0];

    return WeatherModel(
        date: data['location']['localtime'],
        temp: jsonData['day']['avgtemp_c'],
        maxTemp: jsonData['day']['maxtemp_c'],
        minTemp: jsonData['day']['mintemp_c'],
        weatherStateName: jsonData['day']['condition']['text']);
  }

  String getImage() {
    print(weatherStateName);
    if (weatherStateName == 'Clear' ||
        weatherStateName == 'Light Cloud') {
      return 'assets/images/clear.png';
    } else if (weatherStateName == 'Thunderstorm' ||
        weatherStateName == 'Thunder' ) {
      return 'assets/images/thunderstorm.png';
    } else if (weatherStateName == 'Snow' ||
        weatherStateName == 'Hail' ||
        weatherStateName == 'Sleet') {
      return 'assets/images/snow.png';
    } else if (weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers' ||
        weatherStateName == 'Patchy rain nearby' ||
        weatherStateName == 'Moderate rain') {
      return 'assets/images/rainy.png';
    } else if (weatherStateName == 'Heavy Cloudy' ||
        weatherStateName == 'Partly Cloudy') {
      return 'assets/images/cloudy.png';
    } else {
      return 'assets/images/clear.png';
    }
  }
}
