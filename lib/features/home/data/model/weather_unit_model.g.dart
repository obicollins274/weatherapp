// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_unit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherUnitModelSerializer _$WeatherUnitModelSerializerFromJson(Map json) =>
    WeatherUnitModelSerializer(
      temp: (json['temp'] as num?)?.toDouble(),
      temp_min: (json['temp_min'] as num?)?.toDouble(),
      temp_max: (json['temp_max'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$WeatherUnitModelSerializerToJson(
    WeatherUnitModelSerializer instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('temp', instance.temp);
  writeNotNull('temp_min', instance.temp_min);
  writeNotNull('temp_max', instance.temp_max);
  return val;
}
