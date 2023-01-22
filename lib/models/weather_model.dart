class WeatherModel {
  String date;
  double temp;
  double minTemp;
  double maxTemp;
  String weatherState;

  WeatherModel(
      {required this.date,
      required this.temp,
      required this.minTemp,
      required this.maxTemp,
      required this.weatherState});

  factory WeatherModel.fromJson(dynamic weatherData) {
    var jsonData = weatherData['forecast']['forecastday'][0]['day'];
    return WeatherModel(
        date: weatherData['location']['localtime'],
        temp: jsonData['avgtemp_c'],
        minTemp: jsonData['mintemp_c'],
        maxTemp: jsonData['maxtemp_c'],
        weatherState: jsonData['condition']['text']);
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'temp = $temp minTemp = $minTemp maxTemp = $maxTemp date = $date ';
  }
}
