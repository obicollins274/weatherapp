import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/core/utils/repo_response.dart';
import '../../data/model/weather_desc_model.dart';
import '../../data/model/weather_unit_model.dart';
import '../../data/repo/forecast_repo.dart';

class WeatherForecastCubit extends Cubit<WeatherForecastCubitState> {
  late final ForecastRepo repo;

  WeatherForecastCubit({ForecastRepo? repo})
      : super(const WeatherForecastCubitState()) {
    this.repo = repo ?? ForecastRepo();
  }

  Future<bool?> getForecastWeather() async {
    emit(state.copyWith(status: WeatherForecastCubitStatus.fetching));
    final resp = await repo.fetchforecastDetails();
    if (resp.success) {
      emit(state.copyWith(
          status: WeatherForecastCubitStatus.success,
          forecast: resp.serializer?.list
              ?.map((e) => Forecast(
                  unit: WeatherUnitModelSerializer(
                      temp_max: repo.converter.convert(e.unit?.temp_max),
                      temp_min: repo.converter.convert(e.unit?.temp_min),
                      temp: repo.converter.convert(e.unit?.temp)),
                  desc:
                      WeatherDescModelSerializer(icon: e.weather?.first.icon)))
              .toList()));
    } else {
      emit(state.copyWith(
        status: WeatherForecastCubitStatus.failed,
        submissionError: SubmissionError(resp.error?.msg),
      ));
    }
    return null;
  }
}

enum WeatherForecastCubitStatus {
  initial,
  fetching,
  success,
  failed,
}

class Forecast extends Equatable {
  final WeatherUnitModelSerializer? unit;
  final WeatherDescModelSerializer? desc;
  const Forecast({required this.unit, required this.desc});

  @override
  List<Object?> get props => [unit];
}

class WeatherForecastCubitState extends Equatable {
  final WeatherForecastCubitStatus status;
  final SubmissionError submissionError;
  final List<Forecast>? forecast;

  const WeatherForecastCubitState({
    this.status = WeatherForecastCubitStatus.initial,
    this.submissionError = const SubmissionError(),
    this.forecast = const [],
  });

  WeatherForecastCubitState copyWith({
    WeatherForecastCubitStatus? status,
    SubmissionError? submissionError,
    List<Forecast>? forecast,
  }) {
    return WeatherForecastCubitState(
        status: status ?? this.status,
        submissionError: submissionError ?? this.submissionError,
        forecast: forecast ?? this.forecast);
  }

  @override
  List<Object?> get props => [status, submissionError, forecast];
}
