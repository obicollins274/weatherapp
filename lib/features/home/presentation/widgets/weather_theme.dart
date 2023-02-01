import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/core/utils/styles.dart';
import '../bloc/weather_cubit.dart';

class WeatherTheme extends StatelessWidget {
  final bloc = WeatherCubit();

  @override
  Widget build(BuildContext context) {
    bloc.getCurrentWeather();
    return BlocBuilder<WeatherCubit, WeatherCubitState>(
        bloc: bloc,
        builder: (context, state) {
          if (state.status == WeatherCubitStatus.initial ||
              state.status == WeatherCubitStatus.fetching) {
            return const SizedBox.shrink();
          } else {
            if (state.weather?.weather.main == 'Clear') {
              return Container(
                  height: MediaQuery.of(context).size.height * 0.43,
                  decoration: BoxDecoration(
                    color: Sunny,
                    image: DecorationImage(
                        image: AssetImage("assets/images/sea_sunny.png"),
                        fit: BoxFit.cover),
                  ),
                  child: Center(
                      child: Text(
                    "${state.weather!.main!.temp?.toStringAsFixed(0)}° \n "
                    "${state.weather!.weather.main?.toUpperCase()}",
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                          fontWeight: FontWeight.normal,
                        ),
                    textAlign: TextAlign.center,
                  )));
            } else if (state.weather?.weather.main == 'Clouds') {
              return Container(
                  height: MediaQuery.of(context).size.height * 0.43,
                  decoration: BoxDecoration(
                    color: Cloudy,
                    image: DecorationImage(
                        image: AssetImage("assets/images/sea_cloudy.png"),
                        fit: BoxFit.cover),
                  ),
                  child: Center(
                      child: Text(
                    "${state.weather!.main!.temp?.toStringAsFixed(0)}° \n "
                    "${state.weather!.weather.main?.toUpperCase()}",
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                          fontWeight: FontWeight.normal,
                        ),
                    textAlign: TextAlign.center,
                  )));
            } else if (state.weather?.weather.main == 'Rain') {
              return Container(
                  height: MediaQuery.of(context).size.height * 0.43,
                  decoration: BoxDecoration(
                    color: Rainy,
                    image: DecorationImage(
                        image: AssetImage("assets/images/sea_rainy.png"),
                        fit: BoxFit.cover),
                  ),
                  child: Center(
                      child: Text(
                    "${state.weather!.main!.temp?.toStringAsFixed(0)}° \n "
                    "${state.weather!.weather.main?.toUpperCase()}",
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                          fontWeight: FontWeight.normal,
                        ),
                    textAlign: TextAlign.center,
                  )));
            }
            return Container(
                height: MediaQuery.of(context).size.height * 0.43,
                decoration: BoxDecoration(
                  color: Sunny,
                  image: DecorationImage(
                      image: AssetImage("assets/images/sea_sunny.png"),
                      fit: BoxFit.cover),
                ),
                child: Center(
                    child: Text(
                  "${state.weather!.main!.temp?.toStringAsFixed(0)}° \n "
                  "${state.weather!.weather.main?.toUpperCase()}",
                  style: Theme.of(context).textTheme.headline2!.copyWith(
                        fontWeight: FontWeight.normal,
                      ),
                  textAlign: TextAlign.center,
                )));
          }
        });
  }
}
