import 'package:dio/dio.dart';
import 'package:qimah_admin/core/device/device_utility.dart';
import 'package:qimah_admin/data.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String url}) async {
    if (await AppDevice.checkInternetFunction()) {
      var response = await _dio.get(url);
      logger.i(response.data);
      return response.data;
    } else {
      throw DioException.connectionTimeout(
          timeout: const Duration(seconds: 5),
          requestOptions: RequestOptions(),
          error: 'No Internet Connection');
    }
  }

  Future<Map<String, dynamic>> post(
      {required String url, required Map<String, dynamic> data}) async {
    if (await AppDevice.checkInternetFunction()) {
      //! using formData is obligatory ..
      final formData = FormData.fromMap(data);
      var response = await _dio.post(url, data: formData);
      logger.i(response.data);

      return response.data;
    } else {
      throw DioException.connectionTimeout(
          timeout: const Duration(seconds: 5),
          requestOptions: RequestOptions(),
          error: 'No Internet Connection');
    }
  }

  Future<Map<String, dynamic>> postMore(
      {required String url, required String data}) async {
    if (await AppDevice.checkInternetFunction()) {
      var response = await _dio.post(url, data: data);
      logger.i(response.data);
      return response.data;
    } else {
      throw DioException.connectionTimeout(
          timeout: const Duration(seconds: 5),
          requestOptions: RequestOptions(),
          error: 'No Internet Connection');
    }
  }
}
