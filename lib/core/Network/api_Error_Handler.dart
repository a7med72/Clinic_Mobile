import 'package:clinic_mobile/core/Network/api_error_model.dart';
import 'package:dio/dio.dart';

/// 🔹 Enum
enum DataSource {
  noContent,
  badRequest,
  forbidden,
  unauthorised,
  notFound,
  internalServerError,
  connectTimeout,
  cancel,
  receiveTimeout,
  sendTimeout,
  cacheError,
  noInternetConnection,
  defaultError,
}

/// 🔹 Messages (VERY IMPORTANT)
class ApiErrors {
  static const noContent = "No content";
  static const badRequestError = "Bad request";
  static const unauthorizedError = "Unauthorized";
  static const forbiddenError = "Forbidden";
  static const notFoundError = "Not found";
  static const internalServerError = "Server error";
  static const timeoutError = "Timeout";
  static const cacheError = "Cache error";
  static const noInternetError = "No internet connection";
  static const defaultError = "Something went wrong";
}

/// 🔹 Codes
class ResponseCode {
  static const success = 200;
  static const noContent = 201;
  static const badRequest = 400;
  static const unauthorised = 401;
  static const forbidden = 403;
  static const notFound = 404;
  static const internalServerError = 500;
  static const apiLogicError = 422;

  // Local
  static const connectTimeout = -1;
  static const cancel = -2;
  static const receiveTimeout = -3;
  static const sendTimeout = -4;
  static const cacheError = -5;
  static const noInternetConnection = -6;
  static const defaultError = -7;
}

/// 🔹 Mapper
class ErrorMapper {
  static final Map<DataSource, ApiErrorModel> _map = {
    DataSource.noContent: ApiErrorModel(
      code: ResponseCode.noContent,
      message: ApiErrors.noContent,
    ),   
    DataSource.badRequest: ApiErrorModel(
      code: ResponseCode.badRequest,
      message: ApiErrors.badRequestError,
    ),
    DataSource.forbidden: ApiErrorModel(
      code: ResponseCode.forbidden,
      message: ApiErrors.forbiddenError,
    ),
    DataSource.unauthorised: ApiErrorModel(
      code: ResponseCode.unauthorised,
      message: ApiErrors.unauthorizedError,
    ),
    DataSource.notFound: ApiErrorModel(
      code: ResponseCode.notFound,
      message: ApiErrors.notFoundError,
    ),
    DataSource.internalServerError: ApiErrorModel(
      code: ResponseCode.internalServerError,
      message: ApiErrors.internalServerError,
    ),
    DataSource.connectTimeout: ApiErrorModel(
      code: ResponseCode.connectTimeout,
      message: ApiErrors.timeoutError,
    ),
    DataSource.cancel: ApiErrorModel(
      code: ResponseCode.cancel,
      message: ApiErrors.defaultError,
    ),
    DataSource.receiveTimeout: ApiErrorModel(
      code: ResponseCode.receiveTimeout,
      message: ApiErrors.timeoutError,
    ),
    DataSource.sendTimeout: ApiErrorModel(
      code: ResponseCode.sendTimeout,
      message: ApiErrors.timeoutError,
    ),
    DataSource.cacheError: ApiErrorModel(
      code: ResponseCode.cacheError,
      message: ApiErrors.cacheError,
    ),
    DataSource.noInternetConnection: ApiErrorModel(
      code: ResponseCode.noInternetConnection,
      message: ApiErrors.noInternetError,
    ),
    DataSource.defaultError: ApiErrorModel(
      code: ResponseCode.defaultError,
      message: ApiErrors.defaultError,
    ),
  };

  static ApiErrorModel map(DataSource source) =>
      _map[source] ?? _map[DataSource.defaultError]!;
}

/// 🔹 Error Handler
class ErrorHandler implements Exception {
  final ApiErrorModel apiErrorModel;

  ErrorHandler.handle(dynamic error) : apiErrorModel = _handle(error);
}

/// 🔹 Main Handler
ApiErrorModel _handle(dynamic error) {
  if (error is DioException) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ErrorMapper.map(DataSource.connectTimeout);

      case DioExceptionType.sendTimeout:
        return ErrorMapper.map(DataSource.sendTimeout);

      case DioExceptionType.receiveTimeout:
        return ErrorMapper.map(DataSource.receiveTimeout);

      case DioExceptionType.cancel:
        return ErrorMapper.map(DataSource.cancel);

      case DioExceptionType.connectionError:
        return ErrorMapper.map(DataSource.noInternetConnection);

      case DioExceptionType.badCertificate:
        return ErrorMapper.map(DataSource.defaultError);

      case DioExceptionType.badResponse:
        return _handleResponse(error.response);

      case DioExceptionType.unknown:
        return ErrorMapper.map(DataSource.defaultError);
    }
  }

  return ErrorMapper.map(DataSource.defaultError);
}

/// 🔹 Handle API Response Safely
ApiErrorModel _handleResponse(Response? response) {
  if (response == null) {
    return ErrorMapper.map(DataSource.defaultError);
  }

  /// ✅ لو API رجع JSON صح
  if (response.data is Map<String, dynamic>) {
    try {
      return ApiErrorModel.fromJson(response.data);
    } catch (_) {
      // fallback
    }
  }

  /// ✅ fallback based on status code
  switch (response.statusCode) {
    case 400:
      return ErrorMapper.map(DataSource.badRequest);
    case 401:
      return ErrorMapper.map(DataSource.unauthorised);
    case 403:
      return ErrorMapper.map(DataSource.forbidden);
    case 404:
      return ErrorMapper.map(DataSource.notFound);
    case 500:
      return ErrorMapper.map(DataSource.internalServerError);
    default:
      return ErrorMapper.map(DataSource.defaultError);
  }
}

/// 🔹 Internal Status
class ApiInternalStatus {
  static const success = 0;
  static const failure = 1;
}
