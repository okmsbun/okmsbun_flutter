import 'package:dio/dio.dart';

/// Extension on [Response] to convert it to a map.
/// This is useful for logging and debugging purposes.
/// It converts the [Response] object to a [Map] object.
extension DioResponseExtension on Response {
  /// Converts the [Response] object to a [Map] object.
  Map<String, dynamic> get toMap => {
        'data': data,
        'requestOptions': requestOptions.toMap,
        'statusCode': statusCode,
        'statusMessage': statusMessage,
        'isRedirect': isRedirect,
        'redirects': redirects.map((x) => x.toMap).toList(),
        'extra': extra,
        'headers': headers.toMap,
      };
}

/// Extension on [RequestOptions] to convert it to a map.
/// This is useful for logging and debugging purposes.
/// It converts the [RequestOptions] object to a [Map] object.

extension RequestOptionExtension on RequestOptions {
  /// Converts the [RequestOptions] object to a [Map] object.
  Map<String, dynamic> get toMap => {
        'method': method,
        'sendTimeout': sendTimeout?.inMilliseconds,
        'receiveTimeout': receiveTimeout?.inMilliseconds,
        'connectTimeout': connectTimeout?.inMilliseconds,
        'data': data,
        'path': path,
        'baseUrl': baseUrl,
        'queryParameters': queryParameters,
        'onReceiveProgress': onReceiveProgress,
        'onSendProgress': onSendProgress,
        'cancelToken': cancelToken?.toMap,
        'extra': extra,
        'headers': headers,
        'preserveHeaderCase': preserveHeaderCase,
        'responseType': responseType.name,
        'validateStatus': validateStatus.toString(),
        'receiveDataWhenStatusError': receiveDataWhenStatusError,
        'followRedirects': followRedirects,
        'maxRedirects': maxRedirects,
        'persistentConnection': persistentConnection,
        'requestEncoder': requestEncoder,
        'responseDecoder': responseDecoder,
        'listFormat': listFormat.name,
      };
}

/// Extension on [RedirectRecord] to convert it to a map.
/// This is useful for logging and debugging purposes.
/// It converts the [RedirectRecord] object to a [Map] object.
extension RedirectRecordExtension on RedirectRecord {
  /// Converts the [RedirectRecord] object to a [Map] object.
  Map<String, dynamic> get toMap => {
        'statusCode': statusCode,
        'method': method,
        'location': location.toString(),
      };
}

/// Extension on [Headers] to convert it to a map.
/// This is useful for logging and debugging purposes.
/// It converts the [Headers] object to a [Map] object.
extension HeadersExtension on Headers {
  /// Converts the [Headers] object to a [Map] object.
  Map<String, dynamic> get toMap => {
        'preserveHeaderCase': preserveHeaderCase,
        'map': map,
      };
}

/// Extension on [CancelToken] to convert it to a map.
/// This is useful for logging and debugging purposes.
/// It converts the [CancelToken] object to a [Map] object.
extension CancelTokenExtension on CancelToken {
  /// Converts the [CancelToken] object to a [Map] object.
  Map<String, dynamic> get toMap => {
        'cancelError': cancelError?.toMap,
        'isCancelled': isCancelled,
        'requestOptions': requestOptions?.toMap,
      };
}

/// Extension on [DioException] to convert it to a map.
/// This is useful for logging and debugging purposes.
/// It converts the [DioException] object to a [Map] object.
extension DioExceptionExtension on DioException {
  /// Converts the [DioException] object to a [Map] object.
  Map<String, dynamic> get toMap => {
        'requestOptions': requestOptions.toMap,
        'response': response?.toMap,
        'type': type.name,
        'error': error,
        'stackTrace': stackTrace.toString(),
        'message': message,
      };
}
