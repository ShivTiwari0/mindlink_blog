import 'dart:developer';

import 'package:mindlink_blog/core/api.dart';
import 'package:mindlink_blog/data/model/text_news_model.dart';


class TextNewsRepository{
  final _api = Api();

  Future<List<TextNewsModel>> getAllTextNews()async{
  try {
    final response = await _api.sendRequest.get ('https://saurav.tech/NewsAPI//top-headlines/category/science/in.json');
    ApiResponse<List<TextNewsModel>> apiResponse = ApiResponse.fromResponse(
        response,
        (data) => (data['articles'] as List).map((item) => TextNewsModel.fromJson(item)).toList(),
      );
        if (response.statusCode == 200) {
        return apiResponse.data ?? [];
      } else {
        throw Exception('Error fetching videos: ${response.statusMessage}');
      }
  }  catch (e, stacktrace) {
      log('Error fetching videos: $e');
      log('Stacktrace: $stacktrace');
      rethrow;
  } 
}}