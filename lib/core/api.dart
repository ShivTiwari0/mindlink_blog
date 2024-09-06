import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';



  
class Api {
  final Dio _dio = Dio();
  Api() {
   
     
    _dio.interceptors.add(PrettyDioLogger(
        responseBody: true,
        requestBody: true,  
        requestHeader: true,
        responseHeader: true));
  }
  Dio get sendRequest => _dio;
}
 
class ApiResponse<T> {
  T? data;
  String? message;

  ApiResponse({
    this.data,
    this.message,
  });

  factory ApiResponse.fromResponse(Response response, T Function(dynamic) fromJson) {
    try {
      final data = response.data; // It can be a list or map
      return ApiResponse<T>(
        data: fromJson(data),
        message: response.statusMessage,
      );
    } catch (e) {
      throw Exception("Error parsing response: $e");
    }
  }
}

