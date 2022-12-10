import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../utilities/endpoints.dart';

abstract class APIProvider {
  Future<Response> post({
    String? baseUrl,
    required String endPoint,
    dynamic data,
    dynamic query,
    String? token,
    ProgressCallback? progressCallback,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  });

  Future<Response> get({
    String? baseUrl,
    required String endPoint,
    dynamic data,
    dynamic query,
    String? token,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  });

  Future<Response> put({
    String? baseUrl,
    required String endPoint,
    dynamic data,
    dynamic query,
    String? token,
    CancelToken? cancelToken,
    ProgressCallback? progressCallback,
    int? timeOut,
    bool isMultipart = false,
  });
}

class APIProviderImpl implements APIProvider {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: baseApiUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 5000,
    ),
  );
  @override
  Future<Response> get(
      {String? baseUrl,
      required String endPoint,
      data,
      query,
      String? token,
      CancelToken? cancelToken,
      int? timeOut,
      bool isMultipart = false}) async {
    if (timeOut != null) {
      dio.options.connectTimeout = timeOut;
    }

    dio.options.headers = {
      if (isMultipart) 'Content-Type': 'multipart/form-data',
      if (!isMultipart) 'Content-Type': 'application/json',
      if (!isMultipart) 'Accept': 'application/json',
      if (token != null) 'Authorization': "Bearer $token",
    };

    debugPrint('URL => ${dio.options.baseUrl + endPoint}');
    debugPrint('Header => ${dio.options.headers.toString()}');
    debugPrint('Body => $data');
    debugPrint('Query => $query');

    return await dio.get(
      endPoint,
      queryParameters: query,
      cancelToken: cancelToken,
    );
  }

  @override
  Future<Response> post(
      {String? baseUrl,
      required String endPoint,
      data,
      query,
      String? token,
      ProgressCallback? progressCallback,
      CancelToken? cancelToken,
      int? timeOut,
      bool isMultipart = false}) async {
    if (timeOut != null) {
      dio.options.connectTimeout = timeOut;
    }
    dio.options.validateStatus=(status) => true;
    dio.options.headers = {
      if (isMultipart) 'Content-Type': 'multipart/form-data',
      if (!isMultipart) 'Content-Type': 'application/json',
      if (!isMultipart) 'Accept': 'application/json',
      if (token != null) 'Authorization': "Bearer $token",
    };

    debugPrint('URL => ${dio.options.baseUrl + endPoint}');
    debugPrint('Header => ${dio.options.headers.toString()}');
    debugPrint('Body => $data');
    debugPrint('Query => $query');

    return await dio.post(
      endPoint,
      data: data,
      queryParameters: query,
      onSendProgress: progressCallback,
      cancelToken: cancelToken,
    );
  }

  @override
  Future<Response> put(
      {String? baseUrl,
      required String endPoint,
      data,
      query,
      String? token,
      ProgressCallback? progressCallback,
      CancelToken? cancelToken,
      int? timeOut,
      bool isMultipart = false}) async {
    if (timeOut != null) {
      dio.options.connectTimeout = timeOut;
    }

    dio.options.headers = {
      if (isMultipart) 'Content-Type': 'multipart/form-data',
      if (!isMultipart) 'Content-Type': 'application/json',
      if (!isMultipart) 'Accept': 'application/json',
      if (token != null) 'Authorization': token,
    };

    debugPrint('URL => ${dio.options.baseUrl + endPoint}');
    debugPrint('Header => ${dio.options.headers.toString()}');
    debugPrint('Body => $data');
    debugPrint('Query => $query');

    return await dio.put(
      endPoint,
      data: data,
      queryParameters: query,
      onSendProgress: progressCallback,
      cancelToken: cancelToken,
    );
  }
}
