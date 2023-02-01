import 'package:geolocator/geolocator.dart';
import 'package:weapp/core/utils/format.dart';

import '/core/utils/api.dart';
import '/core/utils/repo_response.dart';
import '../model/forecast_model.dart';

class ForecastRepo {
  final ForecastModel forecastDataProvider = ForecastModel();
  final converter = Formatter();

  Future<RepoResp<ForecastModelSerializer>> fetchforecastDetails() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    double? lat = position.latitude;
    double lon = position.longitude;
    try {
      await forecastDataProvider.retrieve(
          urlAppend: "lat=$lat&lon=$lon&appid=$APP_ID");
    } on APIException catch (e) {
      return RepoResp(success: false, error: e);
    }
    return RepoResp(
      success: true,
      serializer: forecastDataProvider.data,
    );
  }
}
