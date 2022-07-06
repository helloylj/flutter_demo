import 'package:dio/dio.dart';

var dio = Dio(
  BaseOptions(
    connectTimeout: 30000,
    headers: {
      'content-type': 'application/json',
    },
  ),
);

class RequestUtil {
  static get(String url, [Map<String, dynamic>? params]) async {
    dynamic response;

    if (params != null) {
      response = await dio.get(url, queryParameters: params);
    } else {
      response = await dio.get(url);
    }
    return response.data;
  }

  static post(String url, [Map<String, dynamic>? params]) async {
    var response = await dio.post(url, data: params);
    return response.data;
  }
}
