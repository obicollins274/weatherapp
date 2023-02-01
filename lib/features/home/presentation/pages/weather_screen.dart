import 'package:flutter/material.dart';
import 'package:weapp/core/utils/styles.dart';

import '../widgets/current_weather_widget.dart';
import '../widgets/forecast_weather_widget.dart';

class WeatherScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: DVTBlue,
        child: Center(
            child: SingleChildScrollView(
                child: Column(
          children: [
            CurrentWeather(),
            ForecastWeather(),
          ],
        ))));
  }
}
