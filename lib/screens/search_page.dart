import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchPage extends StatelessWidget {
  SearchPage({this.updateUi});

  VoidCallback? updateUi;

  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a City'),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onSubmitted: (userInput) async {
              cityName = userInput;
              WeatherService service = WeatherService();
              WeatherModel weather =
                  await service.getWeather(cityName: cityName!);
              Provider.of<WeatherProvider>(context, listen: false).weatherData =
                  weather;
              Provider.of<WeatherProvider>(context, listen: false).cityName =
                  cityName;
              print(weather);
              Navigator.of(context).pop();
              // Navigator.maybePop(context);
            },
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 28, horizontal: 16),
              border: const OutlineInputBorder(
                borderSide: BorderSide(width: 3, color: Colors.amber),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 3, color: Colors.amber),
              ),
              label: const Text('Search'),
              suffixIcon: GestureDetector(
                onTap: () async {
                  WeatherService service = WeatherService();

                  WeatherModel? weather =
                      await service.getWeather(cityName: cityName!);

                  Provider.of<WeatherProvider>(context, listen: false)
                      .weatherData = weather;
                  Provider.of<WeatherProvider>(context, listen: false)
                      .cityName = cityName;
                  Navigator.pop(context);
                },
                child: const Icon(Icons.search),
              ),
              hintText: 'Enter a city',
            ),
          ),
        ),
      ),
    );
  }
}
