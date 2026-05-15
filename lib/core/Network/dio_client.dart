import 'dart:math';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  DioClient._();

  static Dio? dio;

  static Dio getDio() {
    Duration timeout = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeout
        ..options.receiveTimeout = timeout;
      addHeaders();
      addinterceptors();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addHeaders() async {
    dio?.options.headers = {'Accept': 'application/json'};
  }

  static void addinterceptors() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }
}
