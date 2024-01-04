import 'package:dio/dio.dart';

extension DioResponseExtension on Response {
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

extension RequestOptionExtension on RequestOptions {
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
        'responseType': responseType,
        'validateStatus': validateStatus,
        'receiveDataWhenStatusError': receiveDataWhenStatusError,
        'followRedirects': followRedirects,
        'maxRedirects': maxRedirects,
        'persistentConnection': persistentConnection,
        'requestEncoder': requestEncoder,
        'responseDecoder': responseDecoder,
        'listFormat': listFormat,
      };
}

extension RedirectRecordExtension on RedirectRecord {
  Map<String, dynamic> get toMap => {
        'statusCode': statusCode,
        'method': method,
        'location': location.toString(),
      };
}

extension HeadersExtension on Headers {
  Map<String, dynamic> get toMap => {
        'preserveHeaderCase': preserveHeaderCase,
        'map': map,
      };
}

extension CancelTokenExtension on CancelToken {
  Map<String, dynamic> get toMap => {
        'cancelError': cancelError?.toMap,
        'isCancelled': isCancelled,
        'requestOptions': requestOptions?.toMap,
      };
}

extension DioExceptionExtension on DioException {
  Map<String, dynamic> get toMap => {
        'requestOptions': requestOptions.toMap,
        'response': response?.toMap,
        'type': type.name,
        'error': error,
        'stackTrace': stackTrace.toString(),
        'message': message,
      };
}
