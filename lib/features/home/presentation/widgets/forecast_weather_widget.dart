import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weapp/features/home/presentation/bloc/weather_forecast_cubit.dart';

class ForecastWeather extends StatelessWidget {
  final bloc = WeatherForecastCubit();
  ForecastWeather({super.key});

  @override
  Widget build(BuildContext context) {
    bloc.getForecastWeather();
    return BlocBuilder<WeatherForecastCubit, WeatherForecastCubitState>(
        bloc: bloc,
        builder: (context, state) {
          if (state.status == WeatherForecastCubitStatus.initial ||
              state.status == WeatherForecastCubitStatus.fetching) {
            return const Center(
                child: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ));
          } else if (state.status == WeatherForecastCubitStatus.failed) {
            return Center(child: Text(state.submissionError.error!));
          }
          return Container(
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 10),
              decoration: const BoxDecoration(
                color: Color(0xff4e92df),
              ),
              height: MediaQuery.of(context).size.height * 0.57,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  itemCount: 5,
                  padding: const EdgeInsets.fromLTRB(5, 15, 5, 15),
                  itemBuilder: (context, index) {
                    final wfc = state.forecast![index];
                    DateTime dateTime = DateTime.now();
                    final today = dateTime.add(Duration(days: index + 1));
                    String nextdate = DateFormat('EEEE').format(today);
                    return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Column(children: [
                          ListTile(
                            minLeadingWidth: 150,
                            leading: Text(
                              nextdate,
                              style: Theme.of(context).textTheme.bodyText1!,
                              textAlign: TextAlign.left,
                            ),
                            title: Align(
                                alignment: Alignment.centerLeft,
                                child: SizedBox(
                                  height: 32,
                                  width: 32,
                                  child: Image.network(
                                      "https://openweathermap.org/img/wn/${wfc.desc?.icon}.png"),
                                )),
                            trailing: Text(
                                "${wfc.unit?.temp_max?.toStringAsFixed(0)}°",
                                style: Theme.of(context).textTheme.bodyText1!),
                            dense: true,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 5.0, vertical: 0.0),
                          ),
                        ]));
                  }));
        });
  }
}
