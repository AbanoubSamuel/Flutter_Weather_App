import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit.dart';

import '../models/weather_model.dart';

class SuccessWidget extends StatelessWidget {
  const SuccessWidget({
    super.key,
    required this.weatherData,
  });

  final WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          weatherData!.getThemeColor(),
          weatherData!.getThemeColor()[300]!,
          weatherData!.getThemeColor()[100]!,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(
            flex: 3,
          ),
          Text(
            '${BlocProvider.of<WeatherCubit>(context).cityName}',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'updated at: ${weatherData!.date}',
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(weatherData!.getImage()),
              Text(
                weatherData?.temp.toInt().toString() ?? '30',
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              Column(
                children: [
                  Text('minTemp: ${weatherData?.minTemp.toInt()}'),
                  Text('maxTemp: ${weatherData?.maxTemp.toInt()}')
                ],
              ),
            ],
          ),
          const Spacer(
            flex: 1,
          ),
          Text(
            weatherData?.weatherState ?? 'Clear',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(
            flex: 6,
          ),
        ],
      ),
    );
  }
}
