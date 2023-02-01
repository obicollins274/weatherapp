import 'package:json_annotation/json_annotation.dart';

import '/core/utils/api.dart';

part 'weather_description_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class WeatherDescriptionModelSerializer {
  String? main;
  String? description;
  String? icon;
  WeatherDescriptionModelSerializer({this.main, this.description, this.icon});

  factory WeatherDescriptionModelSerializer.fromJson(
      Map<String, dynamic> json) {
    return _$WeatherDescriptionModelSerializerFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$WeatherDescriptionModelSerializerToJson(this);
  }
}

class WeatherDescriptionModel
    extends GenericAPIModel<WeatherDescriptionModelSerializer> {
  @override
  final String endpoint = "weather?";

  @override
  late WeatherDescriptionModelSerializer data;
  @override
  late final WeatherDescriptionModelSerializer Function(dynamic)
      serializeFromJson =
      (dynamic json) => _$WeatherDescriptionModelSerializerFromJson(json);

  @override
  late final dynamic Function(WeatherDescriptionModelSerializer)
      serializeToJson =
      (model) => _$WeatherDescriptionModelSerializerToJson(model);
}
