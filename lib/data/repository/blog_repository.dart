import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:mindlink_blog/core/api.dart';
import 'package:mindlink_blog/data/model/blog_model.dart';

const Map<String, dynamic> DEAFULT_HEADERS = {
  'x-hasura-admin-secret': '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6'
}; 

class BlogRepository {

  final Dio _dio = Dio();
  Future<List<BlogModel>> getAllBlogs() async {
    try { 
       _dio.options.headers = DEAFULT_HEADERS; 
      Response response = await _dio.get("https://intent-kit-16.hasura.app/api/rest/blogs");

      ApiResponse<List<BlogModel>> apiResponse = ApiResponse.fromResponse(
        response, 
        (data) => (data['blogs'] as List).map((item) => BlogModel.fromJson(item)).toList()
      );


      if (response.statusCode == 200) {
         return apiResponse.data ?? [];
     

      
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e, stacktrace) {
      log('Error fetching blogs: $e');
      log('Stacktrace: $stacktrace');
 rethrow;
    }
  }
}
