import 'package:dio/dio.dart';

import 'end_points.dart';


class DioHelper {
  static Dio? _dio;

  static init() {
    _dio = Dio(BaseOptions(
      baseUrl: EndPoints.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout:const Duration(seconds: 10), //10 second
      receiveTimeout:const Duration(seconds: 10),


    ));
  }
  static Future<Response> getData(
      {required String url, Map<String, dynamic>? query,
        String? Token,String? lang}) {
    _dio!.options.headers = {
      "Content-Type": "application/json",
      "Accept": "*/*",
      "Authorization": Token,
      'Lang':lang

    };
    return _dio!.get(url, queryParameters: query);
  }

  static Future<Response> postData(
      {required String url,
        required  body,
        Map<String, dynamic>? query,
        String? Token,
        String? lang,

      }) {
    _dio!.options.headers = {
      "Content-Type": "application/json",
      "Accept": "*/*",
      "Authorization": Token,
      'Lang':lang

    };
    return _dio!.post(url, queryParameters: query, data: body);
  }
  static Future<Response> putData(
      {required String url,
        required  body,
        Map<String, dynamic>? query,
        String? Token,
        String? lang,
      }) {
    _dio!.options.headers = {
      "Content-Type": "application/json",
      "Accept": "*/*",
      "Authorization": Token,
      'Lang':lang
    };
    return _dio!.put(url, queryParameters: query, data: body);
  }
  static Future<Response> deleteData(
      {required String url,
        Map<String, dynamic>? data,
        Map<String, dynamic>? query,
        String? Token,
        String? lang
      }) {
    _dio!.options.headers = {
      "Content-Type": "application/json",
      "Accept": "*/*",
      "Authorization": Token,
      'Lang':lang

    };
    return _dio!.delete(url, queryParameters: query, data: data);
  }
}