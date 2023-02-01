import 'package:json_annotation/json_annotation.dart';
import 'package:weapp/features/home/data/model/weather_desc_model.dart';
import 'package:weapp/features/home/data/model/weather_unit_model.dart';

import '/core/utils/api.dart';

part 'list_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class ListModelSerializer {
  double? temp;
  double? temp_min;
  double? temp_max;
  String? icon;
  @JsonKey(name: "main")
  WeatherUnitModelSerializer? unit;
  List<WeatherDescModelSerializer>? weather;
  ListModelSerializer(
      {this.temp,
      this.temp_min,
      this.temp_max,
      this.icon,
      this.unit,
      this.weather});

  factory ListModelSerializer.fromJson(Map<String, dynamic> json) {
    return _$ListModelSerializerFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ListModelSerializerToJson(this);
  }
}

class ListModel extends GenericAPIModel<ListModelSerializer> {
  @override
  final String endpoint = "forecast?";

  @override
  late ListModelSerializer data;
  @override
  late final ListModelSerializer Function(dynamic) serializeFromJson =
      (dynamic json) => _$ListModelSerializerFromJson(json);

  @override
  late final dynamic Function(ListModelSerializer) serializeToJson =
      (model) => _$ListModelSerializerToJson(model);
}
