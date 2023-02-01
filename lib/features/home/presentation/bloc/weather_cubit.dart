import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weapp/features/home/data/model/weather_description_model.dart';

import '/core/utils/repo_response.dart';
import '/features/home/data/repo/weather_repo.dart';
import '../../data/model/weather_unit_model.dart';

class WeatherCubit extends Cubit<WeatherCubitState> {
  late final WeatherRepo repo;

  WeatherCubit({WeatherRepo? repo}) : super(const WeatherCubitState()) {
    this.repo = repo ?? WeatherRepo();
  }

  Future<bool?> getCurrentWeather() async {
    emit(state.copyWith(status: WeatherCubitStatus.fetching));
    final resp = await repo.fetchweatherDetails();
    if (resp.success) {
      emit(state.copyWith(
          status: WeatherCubitStatus.success,
          weather: Weather(
              main: WeatherUnitModelSerializer(
                temp: repo.converter.convert(resp.serializer?.main!.temp),
                temp_min:
                    repo.converter.convert(resp.serializer?.main!.temp_min),
                temp_max:
                    repo.converter.convert(resp.serializer?.main!.temp_max),
              ),
              weather: WeatherDescriptionModelSerializer(
                  main: resp.serializer?.weather!.first.main,
                  description: resp.serializer?.weather!.first.description,
                  icon: resp.serializer?.weather!.first.icon))));
    } else {
      emit(state.copyWith(
        status: WeatherCubitStatus.failed,
        submissionError: SubmissionError(resp.error?.msg),
      ));
    }
    return null;
  }
}

enum WeatherCubitStatus {
  initial,
  fetching,
  success,
  failed,
}

class Weather extends Equatable {
  final WeatherUnitModelSerializer? main;
  final WeatherDescriptionModelSerializer weather;

  const Weather({required this.main, required this.weather});

  @override
  List<Object?> get props => [main, weather];
}

class WeatherDesc extends Equatable {
  final int? id;
  final String? description;
  final String? icon;

  const WeatherDesc(
      {required this.id, required this.description, required this.icon});

  @override
  List<Object?> get props => [id, description, icon];
}

class WeatherUnit extends Equatable {
  final double? temp;
  final double? temp_min;
  final double? temp_max;

  const WeatherUnit(
      {required this.temp, required this.temp_min, required this.temp_max});

  @override
  List<Object?> get props => [temp, temp_min, temp_max];
}

class WeatherCubitState extends Equatable {
  final WeatherCubitStatus status;
  final SubmissionError submissionError;
  final Weather? weather;

  const WeatherCubitState({
    this.status = WeatherCubitStatus.initial,
    this.submissionError = const SubmissionError(),
    this.weather,
  });

  WeatherCubitState copyWith({
    WeatherCubitStatus? status,
    SubmissionError? submissionError,
    Weather? weather,
  }) {
    return WeatherCubitState(
        status: status ?? this.status,
        submissionError: submissionError ?? this.submissionError,
        weather: weather ?? this.weather);
  }

  @override
  List<Object?> get props => [status, submissionError, weather];
}
