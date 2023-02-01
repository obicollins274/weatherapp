// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListModelSerializer _$ListModelSerializerFromJson(Map json) =>
    ListModelSerializer(
      temp: (json['temp'] as num?)?.toDouble(),
      temp_min: (json['temp_min'] as num?)?.toDouble(),
      temp_max: (json['temp_max'] as num?)?.toDouble(),
      icon: json['icon'] as String?,
      unit: json['main'] == null
          ? null
          : WeatherUnitModelSerializer.fromJson(
              Map<String, dynamic>.from(json['main'] as Map)),
      weather: (json['weather'] as List<dynamic>?)
          ?.map((e) => WeatherDescModelSerializer.fromJson(
              Map<String, dynamic>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$ListModelSerializerToJson(ListModelSerializer instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('temp', instance.temp);
  writeNotNull('temp_min', instance.temp_min);
  writeNotNull('temp_max', instance.temp_max);
  writeNotNull('icon', instance.icon);
  writeNotNull('main', instance.unit);
  writeNotNull('weather', instance.weather);
  return val;
}
