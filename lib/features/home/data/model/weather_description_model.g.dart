// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_description_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherDescriptionModelSerializer _$WeatherDescriptionModelSerializerFromJson(
        Map json) =>
    WeatherDescriptionModelSerializer(
      main: json['main'] as String?,
      description: json['description'] as String?,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$WeatherDescriptionModelSerializerToJson(
    WeatherDescriptionModelSerializer instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('main', instance.main);
  writeNotNull('description', instance.description);
  writeNotNull('icon', instance.icon);
  return val;
}
