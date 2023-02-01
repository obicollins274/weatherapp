import 'package:geolocator/geolocator.dart';
import 'package:weapp/core/utils/format.dart';

import '/core/utils/api.dart';
import '/core/utils/repo_response.dart';
import '/features/home/data/model/weather_description_model.dart';
import '../model/weather_model.dart';
import '../model/weather_unit_model.dart';

class WeatherRepo {
  final WeatherModel weatherDataProvider = WeatherModel();
  final WeatherDescriptionModel weatherDescDataProvider =
      WeatherDescriptionModel();
  final WeatherUnitModel weatherUnitDataProvider = WeatherUnitModel();
  final converter = Formatter();

  Future<RepoResp<WeatherModelSerializer>> fetchweatherDetails() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    double? latitude = position.latitude;
    double longitude = position.longitude;
    try {
      await weatherDataProvider.retrieve(
          urlAppend: "lat=$latitude&lon=$longitude&appid=$APP_ID");
    } on APIException catch (e) {
      return RepoResp(success: false, error: e);
    }
    return RepoResp(
      success: true,
      serializer: weatherDataProvider.data,
    );
  }

  Future<RepoResp<WeatherDescriptionModelSerializer>>
      fetchweatherDescDetails() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    double? latitude = position.latitude;
    double longitude = position.longitude;
    try {
      await weatherDescDataProvider.retrieve(
          urlAppend: "lat=$latitude&lon=$longitude&appid=$APP_ID");
    } on APIException catch (e) {
      return RepoResp(success: false, error: e);
    }
    return RepoResp(
      success: true,
      serializer: weatherDescDataProvider.data,
    );
  }

  Future<RepoResp<WeatherUnitModelSerializer>> fetchweatherUnitDetails() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    double? latitude = position.latitude;
    double longitude = position.longitude;
    try {
      await weatherUnitDataProvider.retrieve(
          urlAppend: "lat=$latitude&lon=$longitude&appid=$APP_ID");
    } on APIException catch (e) {
      return RepoResp(success: false, error: e);
    }
    return RepoResp(
      success: true,
      serializer: weatherUnitDataProvider.data,
    );
  }
}
