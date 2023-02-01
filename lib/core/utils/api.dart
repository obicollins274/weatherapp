import 'package:dio/dio.dart';

const String DEV_API_HOST = "api.openweathermap.org/data/2.5";
const String DEV_API_URL = "https://$DEV_API_HOST";
const String APP_ID = "1434cdfb6be39cfe66d4f37b61c5dc12";

String getAPIUrl() {
  return DEV_API_URL;
}

enum HTTPError {
  authenticationError,
  someError,
  connectionError,
}

class APIException implements Exception {
  String msg = "There was an error, try again";
  HTTPError errorType = HTTPError.someError;

  APIException(
      {HTTPError? errorType,
      String? customMsg,
      Map<String, dynamic>? decodedError}) {
    if (errorType != null) {
      this.errorType = errorType;
    }
    if (customMsg != null) {
      msg = customMsg;
    } else {
      this.errorType = HTTPError.someError;
      msg = "There was an error, please try again later.";
    }
  }
}

mixin APIModel {
  final endpoint = "";
  final requiresAuth = true;
  String connectionErrorMsg =
      "Could not connect, check your internet connection.";
  String? host;
  late final Dio client = getClient();

  Dio getClient() {
    Dio dio = Dio();
    return dio;
  }

  Future<Map<String, String>> getHeadersHelper() async {
    var headers = {
      "Content-Type": "application/json;charset=UTF-8",
      "accept": "application/json;charset=UTF-8",
    };
    return headers;
  }

  String buildUrl({String? lookupField, String? urlAppend}) {
    String host;

    if (lookupField != null && lookupField[lookupField.length - 1] != "/") {
      lookupField += "";
    }
    if (urlAppend != null && urlAppend[urlAppend.length - 1] != "/") {
      urlAppend += "";
    }

    if (this.host != null) {
      host = this.host!;
    } else {
      host = getAPIUrl();
    }

    print("$host/$endpoint${urlAppend ?? ""}${lookupField ?? ""}");
    return "$host/$endpoint${urlAppend ?? ""}${lookupField ?? ""}";
  }

  void handleStatusCode(Response resp) {
    final statusCode = resp.statusCode.toString();
    if (statusCode == "401") {
      throw APIException;
    } else if (["501", "502", "503", "307"].contains(statusCode)) {
      throw APIException(
        errorType: HTTPError.connectionError,
        customMsg: "There is an error with the connection, please try again.",
      );
    } else if (statusCode[0] != "2") {
      try {
        throw APIException(decodedError: resp.data as Map<String, dynamic>);
      } on TypeError {
        throw APIException(errorType: HTTPError.someError);
      }
    }
  }

  // Dio make http request
  Future<Response> makeRequest(
      Future<Response> Function(Dio client) apiCall) async {
    try {
      return await apiCall(client);
    } on DioError catch (e) {
      if (e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.other) {
        throw APIException(
          errorType: HTTPError.connectionError,
          customMsg: connectionErrorMsg,
        );
      } else if (e.response != null) {
        return e.response!;
      }
      rethrow;
    }
  }
}

// created an API model for data model
class GenericAPIModel<T> with APIModel {
  @override
  final endpoint = "";
  @override
  final requiresAuth = true;
  late T data;
  @override
  String? host;
  GenericAPIModel({this.host});
  late final T Function(dynamic) serializeFromJson;
  late final dynamic Function(T) serializeToJson;
  @override
  late final Dio client = getClient();

  Future<T> retrieve({
    String? lookupFieldValue,
    Map<String, String>? queryParams,
    String? urlAppend,
  }) async {
    final uri = buildUrl(lookupField: lookupFieldValue, urlAppend: urlAppend);

    callBack(Dio client) async => await client.get(
          uri.toString(),
          queryParameters: queryParams,
          options: Options(headers: await getHeadersHelper()),
        );
    final resp = await makeRequest(callBack);
    return _handleResponse(resp);
  }

  T _handleResponse(Response resp) {
    handleStatusCode(resp);
    if (resp.data.isEmpty) return data;
    data = serializeFromJson(resp.data);
    return data;
  }
}

class GenericAPIModelList<T> with APIModel {
  final endpoint = "";
  final paginated = false;
  String? cursorNext;
  String? cursorPrevious;
  late final T Function(dynamic) serializeFromJson;
  late final dynamic Function(T) serializeToJson;
  @override
  String? host;

  GenericAPIModelList({this.host}) {
    cursorNext = buildUrl();
  }
  List<T> data = [];
  late final Dio clienst = getClient();
  void resetPagination() {
    // start from scratch.
    data = [];
    cursorNext = buildUrl();
    cursorPrevious = null;
  }

  Future<List<T>> list({
    String lookupFieldValue = "",
    Map<String, String>? queryParams,
    bool resetPage = false,
    String? urlAppend,
  }) async {
    final resp = await makeRequest(
      (Dio client) async => await client.get(
        cursorNext!.toString(),
        queryParameters: queryParams,
        options: Options(headers: await getHeadersHelper()),
      ),
    );
    try {
      return _handleResponse(resp);
    } catch (e) {
      resetPagination();
      rethrow;
    }
  }

  List<T> _handleResponse(Response resp) {
    if (resp.data.isEmpty) return data;
    handleStatusCode(resp);

    if (paginated) {
      _parsePaginatedBody(resp.data);
    }
    return data;
  }

  List _parsePaginatedBody(Map<String, dynamic> json) {
    final newNext = json["next"];
    final newPrevious = json["previous"];
    if (newNext == cursorNext && newPrevious == cursorPrevious) {
      return [];
    }
    cursorPrevious = newPrevious;
    cursorNext = newNext;
    return json["list"];
  }
}
