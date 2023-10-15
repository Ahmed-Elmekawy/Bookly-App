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
}
