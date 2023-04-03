import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wakelock/wakelock.dart';
import 'package:weather_app/cubits/weather_cubit.dart';
import 'package:weather_app/screens/home_page.dart';
import 'package:weather_app/services/weather_service.dart';

void main() {
  runApp(BlocProvider(
      create: (context) {
        return WeatherCubit(WeatherService());
      },
      child: const WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Wakelock.toggle(enable: true);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: BlocProvider.of<WeatherCubit>(context).weatherModel == null
              ? Colors.blue
              : BlocProvider.of<WeatherCubit>(context).weatherModel!.getThemeColor(),
        ),
        primaryColor: BlocProvider.of<WeatherCubit>(context).weatherModel == null
            ? Colors.blue
            : BlocProvider.of<WeatherCubit>(context).weatherModel!.getThemeColor(),
        primarySwatch: BlocProvider.of<WeatherCubit>(context).weatherModel == null
            ? Colors.blue
            : BlocProvider.of<WeatherCubit>(context).weatherModel!.getThemeColor(),
      ),
      home: HomePage(),
    );
  }
}
