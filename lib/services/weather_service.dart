import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/weather_model.dart';

class WeatherService {
  String baseUrl = 'https://api.weatherapi.com/v1';
  String apiKey = '92f1f6a8330a49d2b1930734232001';

  Future<WeatherModel> getWeather({required String cityName}) async {
    Uri url = Uri.parse(
        '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7&aqi=no&alerts=no');
    http.Response response = await http.get(url);
    Map<String, dynamic> weatherData = jsonDecode(response.body);
    var jsonData = weatherData['forecast']['forecastday'][0];
    WeatherModel weather = WeatherModel.fromJson(weatherData);
    print(weather);
    return weather;
  }
}
