// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherModelSerializer _$WeatherModelSerializerFromJson(Map json) =>
    WeatherModelSerializer(
      main: json['main'] == null
          ? null
          : WeatherUnitModelSerializer.fromJson(
              Map<String, dynamic>.from(json['main'] as Map)),
      weather: (json['weather'] as List<dynamic>?)
          ?.map((e) => WeatherDescriptionModelSerializer.fromJson(
              Map<String, dynamic>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$WeatherModelSerializerToJson(
    WeatherModelSerializer instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('main', instance.main);
  writeNotNull('weather', instance.weather);
  return val;
}
