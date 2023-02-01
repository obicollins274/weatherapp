// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastModelSerializer _$ForecastModelSerializerFromJson(Map json) =>
    ForecastModelSerializer(
      list: (json['list'] as List<dynamic>?)
          ?.map((e) =>
              ListModelSerializer.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$ForecastModelSerializerToJson(
    ForecastModelSerializer instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('list', instance.list);
  return val;
}
