import 'package:bookly/core/utils/api_keys.dart';
import 'package:dio/dio.dart';

class ApiService {
  static late Dio dio;
  static init() {
    dio = Dio();
  }

  static const baseUrl = 'https://www.googleapis.com/books/v1/';
  static Future<Map<String, dynamic>> getData(
      {required String endPoint}) async {
    var response = await dio.get('$baseUrl$endPoint');
    return response.data;
  }

  Future<Response> postData(
      {required Map<String, dynamic> data,
      required String url,
      required String token,
      Map<String, String>? headers,
      String? contentType}) async {
    var response = await dio.post(url,
        data: data,
        options: Options(
          contentType: contentType,
          headers: headers ?? {'Authorization': "Bearer $token"},
        ));

    return response;
  }
}
