import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit.dart';
import 'package:weather_app/cubits/weather_cubit/weather_state.dart';

import './search_page.dart';
import '../models/weather_model.dart';
import '../widgets/default_widget.dart';
import '../widgets/failure_widget.dart';
import '../widgets/success_widget.dart';

class HomePage extends StatelessWidget {
  WeatherModel? weatherModel;

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    weatherModel = BlocProvider.of<WeatherCubit>(context).weatherModel;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BlocProvider.of<WeatherCubit>(context).weatherModel == null
            ? Colors.blue
            : BlocProvider.of<WeatherCubit>(context).weatherModel!.getThemeColor(),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SearchPage();
                }));
              },
              icon: const Icon(Icons.search))
        ],
        title: const Text('Home Page'),
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(builder: (context, state) {
        if (state is WeatherLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is WeatherSuccess) {
          return SuccessWidget(weatherData: state.weatherModel);
        } else if (state is WeatherFailure) {
          return const FailureWidget();
        } else {
          return const DefaultWidget();
        }
      }),
    );
  }
}
