import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/weather_provider.dart';
import '../models/weather_model.dart';
import './search_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherModel? weatherData;

  void updateUi() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SearchPage(
                    updateUi: updateUi,
                  );
                }));
              },
              icon: const Icon(Icons.search))
        ],
        title: const Text('Home Page'),
      ),
      body: weatherData == null
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'There is no weather 😞 start',
                    style: TextStyle(fontSize: 24),
                  ),
                  Text(
                    'searching now 🔍',
                    style: TextStyle(fontSize: 24),
                  ),
                ],
              ),
            )
          : Container(
              color: Colors.orange,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(
                    flex: 3,
                  ),
                  Text(
                    Provider.of<WeatherProvider>(context).cityName ?? 'Cairo',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'updated: 12-8-2023',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('assets/images/clear.png'),
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
            ),
    );
  }
}
