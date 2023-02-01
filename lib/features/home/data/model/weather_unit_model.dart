import 'package:json_annotation/json_annotation.dart';

import '/core/utils/api.dart';

part 'weather_unit_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class WeatherUnitModelSerializer {
  double? temp;
  double? temp_min;
  double? temp_max;

  factory WeatherUnitModelSerializer.fromJson(Map<String, dynamic> json) {
    return _$WeatherUnitModelSerializerFromJson(json);
  }
  WeatherUnitModelSerializer({this.temp, this.temp_min, this.temp_max});

  Map<String, dynamic> toJson() {
    return _$WeatherUnitModelSerializerToJson(this);
  }
}

class WeatherUnitModel extends GenericAPIModel<WeatherUnitModelSerializer> {
  @override
  final String endpoint = "weather?";

  @override
  late WeatherUnitModelSerializer data;
  @override
  late final WeatherUnitModelSerializer Function(dynamic) serializeFromJson =
      (dynamic json) => _$WeatherUnitModelSerializerFromJson(json);

  @override
  late final dynamic Function(WeatherUnitModelSerializer) serializeToJson =
      (model) => _$WeatherUnitModelSerializerToJson(model);
}
