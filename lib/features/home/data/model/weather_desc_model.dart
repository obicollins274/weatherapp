import 'package:json_annotation/json_annotation.dart';

import '/core/utils/api.dart';

part 'weather_desc_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class WeatherDescModelSerializer {
  String? main;
  String? icon;
  WeatherDescModelSerializer({this.main, this.icon});

  factory WeatherDescModelSerializer.fromJson(Map<String, dynamic> json) {
    return _$WeatherDescModelSerializerFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$WeatherDescModelSerializerToJson(this);
  }
}

class WeatherDescModel extends GenericAPIModel<WeatherDescModelSerializer> {
  @override
  final String endpoint = "weather?";

  @override
  late WeatherDescModelSerializer data;
  @override
  late final WeatherDescModelSerializer Function(dynamic) serializeFromJson =
      (dynamic json) => _$WeatherDescModelSerializerFromJson(json);

  @override
  late final dynamic Function(WeatherDescModelSerializer) serializeToJson =
      (model) => _$WeatherDescModelSerializerToJson(model);
}
