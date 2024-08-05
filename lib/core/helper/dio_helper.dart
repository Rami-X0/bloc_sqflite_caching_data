import 'package:dio/dio.dart';

class DioHelper {
  final Dio _dio;

  DioHelper(this._dio);

  Future<Response> getData({required String url}) async {
    return await _dio.get(url, );
  }
}
