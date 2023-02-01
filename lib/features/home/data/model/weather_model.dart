import 'package:json_annotation/json_annotation.dart';
import 'package:weapp/features/home/data/model/weather_description_model.dart';
import 'package:weapp/features/home/data/model/weather_unit_model.dart';

import '/core/utils/api.dart';

part 'weather_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class WeatherModelSerializer {
  WeatherUnitModelSerializer? main;
  List<WeatherDescriptionModelSerializer>? weather;
  WeatherModelSerializer({this.main, this.weather});

  factory WeatherModelSerializer.fromJson(Map<String, dynamic> json) {
    return _$WeatherModelSerializerFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$WeatherModelSerializerToJson(this);
  }
}

class WeatherModel extends GenericAPIModel<WeatherModelSerializer> {
  @override
  final String endpoint = "weather?";

  @override
  late List<WeatherModelSerializer> datas = [];
  @override
  late final WeatherModelSerializer Function(dynamic) serializeFromJson =
      (dynamic json) => _$WeatherModelSerializerFromJson(json);

  @override
  late final dynamic Function(WeatherModelSerializer) serializeToJson =
      (model) => _$WeatherModelSerializerToJson(model);
}
