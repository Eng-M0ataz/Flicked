import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  ApiService(
    this._dio,
  );

  Future<Map<String, dynamic>> getReq({
    required String endPoint,
    required String baseUrl,
    int? pageNumber,
    String? token,
    int retry = 3,
  }) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll(
        {
          'Authorization': 'Bearer $token',
          'accept': 'application/json',
        },
      );
    }

    Map<String, dynamic> queryParameters = {};
    if (pageNumber != null) {
      queryParameters.addAll(
        {
          'page': pageNumber,
          'language': 'en-US',
        },
      );
    } else {
      queryParameters.addAll(
        {
          'language': 'en-US',
        },
      );
    }

    Response response = await _dio.get(
      '$baseUrl$endPoint',
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
      ),
    );

    Map<String, dynamic> responseData = response.data;
    return responseData;
  }
}
