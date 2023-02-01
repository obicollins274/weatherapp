import 'package:json_annotation/json_annotation.dart';

import '/core/utils/api.dart';
import 'list_model.dart';

part 'forecast_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class ForecastModelSerializer {
  List<ListModelSerializer>? list;
  ForecastModelSerializer({this.list});

  factory ForecastModelSerializer.fromJson(Map<String, dynamic> json) {
    return ForecastModelSerializer(
      list: List.from(json['list'])
          .map((item) => ListModelSerializer.fromJson(item))
          .toList(),
    );
  }
}

class ForecastModel extends GenericAPIModel<ForecastModelSerializer> {
  @override
  final String endpoint = "forecast?";

  @override
  late ForecastModelSerializer data;
  @override
  late final ForecastModelSerializer Function(dynamic) serializeFromJson =
      (dynamic json) => _$ForecastModelSerializerFromJson(json);

  @override
  late final dynamic Function(ForecastModelSerializer) serializeToJson =
      (model) => _$ForecastModelSerializerToJson(model);
}
