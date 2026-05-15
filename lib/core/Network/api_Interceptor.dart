import 'package:clinic_mobile/core/Network/Api_Error_Handler.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

// import '../helpers/shared_pref_helper.dart';
// import '../helpers/constants.dart';

class AppInterceptor extends Interceptor {
  final Dio dio;

  AppInterceptor(this.dio);

  /// ===============================
  /// 1. BEFORE REQUEST (ADD TOKEN)
  /// ===============================
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      // final token = await SharedPrefHelper.getSecuredString(
      //   SharedPrefKeys.userToken,
      // );

      // if (token.isNotEmpty) {
      //   options.headers['Authorization'] = 'Bearer $token';
      // }

      options.headers['Accept'] = 'application/json';

      if (kDebugMode) {
        print('➡️ REQUEST[${options.method}] => PATH: ${options.path}');
      }

      handler.next(options);
    } catch (e) {
      handler.next(options);
    }
  }

  /// ===============================
  /// 2. AFTER RESPONSE
  /// ===============================
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      print(
        '✅ RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
      );
    }

    handler.next(response);
  }

  /// ===============================
  /// 3. ERROR HANDLING
  /// ===============================
 @override
void onError(DioException err, ErrorInterceptorHandler handler) async {
  final apiError = ErrorHandler.handle(err).apiErrorModel;

  if (kDebugMode) {
    print(
      '❌ ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
    );
  }

  /// 🔥 Handle 401 (optional)
  if (err.response?.statusCode == 401) {
    // await _handle401Error();
  }

  /// ✅ Replace error with clean model
  return handler.reject(err.copyWith(error: apiError));
}
  }
  
