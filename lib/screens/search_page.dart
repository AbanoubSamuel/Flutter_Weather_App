import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
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
            onChanged: (data) {
              cityName = data;
            },
            onSubmitted: (data) async {
              cityName = data;
              BlocProvider.of<WeatherCubit>(context).getWeather(cityName: cityName!);
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 28, horizontal: 16),
              border: const OutlineInputBorder(
                borderSide: BorderSide(width: 3, color: Colors.amber),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 3, color: Colors.amber),
              ),
              label: const Text('Search'),
              suffixIcon: GestureDetector(
                onTap: () async {
                  BlocProvider.of<WeatherCubit>(context).getWeather(cityName: cityName!);
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
