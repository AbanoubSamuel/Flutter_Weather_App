import 'package:flutter/cupertino.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? _weatherData;
  String? cityName;

  set weatherData(WeatherModel? data) {
    _weatherData = data;
    notifyListeners();
  }

  WeatherModel? get weatherData => _weatherData;
}
