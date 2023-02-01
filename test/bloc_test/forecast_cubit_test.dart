import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weapp/core/utils/repo_response.dart';
import 'package:weapp/features/home/data/model/forecast_model.dart';
import 'package:weapp/features/home/data/repo/forecast_repo.dart';
import 'package:weapp/features/home/presentation/bloc/weather_forecast_cubit.dart';

class MockWeatherForecastRepo extends Mock implements ForecastRepo {}

void main() {
  group("Weather Forecast Cubit Test", () {
    late MockWeatherForecastRepo repo;

    setUp(() {
      repo = MockWeatherForecastRepo();
    });

    test("initial state", () {
      final bloc = WeatherForecastCubit(repo: repo);
      expect(bloc.state.status, WeatherForecastCubitStatus.initial);
    });

    blocTest(
      "emits Failure on fetch weather forecast details",
      setUp: () {
        when(() => repo.fetchforecastDetails()).thenAnswer(
          (_) async => RepoResp(
            success: false,
          ),
        );
      },
      build: () => WeatherForecastCubit(repo: repo),
      act: (WeatherForecastCubit cubit) async =>
          await cubit.getForecastWeather(),
      expect: () => [
        const WeatherForecastCubitState(status: WeatherForecastCubitStatus.fetching),
        const WeatherForecastCubitState(
          status: WeatherForecastCubitStatus.failed,
        ),
      ],
    );

    blocTest(
      "emits Success on fetch weather forecast details",
      setUp: () {
        final serializer = ForecastModelSerializer();
        when(() => repo.fetchforecastDetails()).thenAnswer(
          (_) async => RepoResp(success: true, serializer: serializer),
        );
      },
      build: () => WeatherForecastCubit(repo: repo),
      act: (WeatherForecastCubit cubit) async =>
          await cubit.getForecastWeather(),
      expect: () => [
        const WeatherForecastCubitState(status: WeatherForecastCubitStatus.fetching),
        const WeatherForecastCubitState(
          status: WeatherForecastCubitStatus.success,
        ),
      ],
    );
  });
}
