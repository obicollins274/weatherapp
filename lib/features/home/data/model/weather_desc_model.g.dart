// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_desc_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherDescModelSerializer _$WeatherDescModelSerializerFromJson(Map json) =>
    WeatherDescModelSerializer(
      main: json['main'] as String?,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$WeatherDescModelSerializerToJson(
    WeatherDescModelSerializer instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('main', instance.main);
  writeNotNull('icon', instance.icon);
  return val;
}
