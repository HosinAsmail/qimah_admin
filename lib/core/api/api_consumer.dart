abstract class ApiConsumer {
  Future<dynamic> get(
      {required String url,
      Map<String, dynamic>? queryParameters,
      Map<String, String>? headers});

  Future<dynamic> post(
      {Object? body,
      required String url,
      bool formDataIsEnabled = false,
      Map<String, dynamic>? queryParameters,
      Map<String, String>? headers});

  Future<dynamic> delete(
      {Object? body,
      required String url,
      Map<String, dynamic>? queryParameters,
      Map<String, String>? headers});

  Future<dynamic> put(
      {Object? body,
      required String url,
      Map<String, dynamic>? queryParameters,
      Map<String, String>? headers});
}
