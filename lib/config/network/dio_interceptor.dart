import 'dart:async';
import 'dart:developer';
import 'package:dio/dio.dart';

import '../../utils/helpers.dart';

class DioInterceptior extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    super.onRequest(options, handler);

    logger(options.data.toString());
    options.headers = {
      'Content-Type': 'application/json',
      'accept': 'application/json',
    };
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger(
        'DioInterceptor.class: ${response.statusCode} ${response.statusMessage}');
    return super.onResponse(response, handler);
  }

  @override
  Future<String> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    super.onError(err, handler);

    log("DioInterceptor.class: Error from dio request: ${err.toString()}, ${err.response?.data?.toString()}, ${err.message}, ${err.requestOptions.data.toString()}, ${err.requestOptions.uri.toString()}");

    if (err.response != null) {
      if (err.response!.data != null) {
        if (err.response!.data!
            .toString()
            .contains("SocketException: Failed Host Lookup")) {
          handler.reject(DioException(
              requestOptions:
                  RequestOptions(path: "", data: {"message": "No Internet"})));
        }
      }
    }
    return err.response?.data?.toString() ?? "";
  }
}
