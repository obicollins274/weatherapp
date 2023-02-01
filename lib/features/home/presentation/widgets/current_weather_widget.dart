import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weapp/core/utils/styles.dart';
import 'package:weapp/features/home/presentation/widgets/weather_theme.dart';

import '../bloc/weather_cubit.dart';

class CurrentWeather extends StatelessWidget {
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
          } else if (state.status == WeatherCubitStatus.failed) {
            return Center(child: Text(state.submissionError.error!));
          }
          return Column(children: [
            WeatherTheme(),
            Container(
                padding: EdgeInsets.fromLTRB(7.5, 10, 7.5, 10),
                decoration: BoxDecoration(
                  color: DVTBlue,
                ),
                width: MediaQuery.of(context).size.width,
                child: Column(children: [
                  SizedBox(height: 10),
                  SizedBox(
                      height: 60,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "${state.weather!.main!.temp_min?.toStringAsFixed(0)}°\n Min",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        fontWeight: FontWeight.normal,
                                      ),
                                  textAlign: TextAlign.center,
                                ),
                                Spacer(),
                                Text(
                                  "${state.weather!.main!.temp?.toStringAsFixed(0)}°\n Current",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        fontWeight: FontWeight.normal,
                                      ),
                                  textAlign: TextAlign.center,
                                ),
                                Spacer(),
                                Text(
                                    "${state.weather!.main!.temp_max?.toStringAsFixed(0)}° \n Max",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                          fontWeight: FontWeight.normal,
                                        ),
                                    textAlign: TextAlign.center)
                              ],
                            ),
                          ),
                        ],
                      )),
                ])),
            Divider(
              height: 5,
              color: Colors.white,
            ),
          ]);
        });
  }
}
