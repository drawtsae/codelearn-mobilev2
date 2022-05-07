import 'package:boilerplate/data/network/constants/endpoints.dart';
import 'package:boilerplate/data/sharedpref/shared_preference_helper.dart';
import 'package:dio/dio.dart';

abstract class NetworkModule {
  /// A singleton dio provider.
  ///
  /// Calling it multiple times will return the same instance.
  static Dio provideDio(SharedPreferenceHelper sharedPrefHelper) {
    final dio = Dio();

    dio
      ..options.baseUrl = Endpoints.baseUrl
      ..options.connectTimeout = Endpoints.connectionTimeout
      ..options.receiveTimeout = Endpoints.receiveTimeout
      ..options.headers = {'Content-Type': 'application/json; charset=utf-8'}
      ..interceptors.add(LogInterceptor(
        request: true,
        responseBody: true,
        requestBody: true,
        requestHeader: true,
      ))
      ..interceptors.add(
        InterceptorsWrapper(onRequest:
            (RequestOptions options, RequestInterceptorHandler handler) async {
          // getting token
          var token = await sharedPrefHelper.authToken;

          if (token != null) {
            options.headers.putIfAbsent('Authorization', () => "Bearer $token");
          } else {
            print('Auth token is null');
          }

          return handler.next(options);
        }, onError: (DioError error, ErrorInterceptorHandler handler) async {
          if (error.response?.statusCode == 401) {
            sharedPrefHelper.removeAuthToken();
            final headers =
                error.requestOptions.headers.remove("Authorization");
            final opts = new Options(
                method: error.requestOptions.method, headers: headers);
            final cloneReq = await dio.request(error.requestOptions.path,
                options: opts,
                data: error.requestOptions.data,
                queryParameters: error.requestOptions.queryParameters);
            return handler.resolve(cloneReq);
          }
          return handler.next(error);
        }),
      );

    return dio;
  }
}
