import 'dart:convert';
import 'dart:developer';
import 'package:mindlink_blog/data/model/video_model.dart';
import 'package:dio/dio.dart';

class VideoRepository {
  final Dio _dio = Dio();

  Future<List<VideoModel>> getAllVideos() async {
    try {
      final response = await _dio.get(
        'https://gist.githubusercontent.com/poudyalanil/ca84582cbeb4fc123a13290a586da925/raw/14a27bd0bcd0cd323b35ad79cf3b493dddf6216b/videos.json',
      );

      // Check if the response is a string and decode it
      dynamic data = response.data;
      if (data is String) {
        data = json.decode(data); // Parse string to JSON
      }

      // Process as List
      if (data is List) {
        return data.map((item) => VideoModel.fromJson(item)).toList();
      } else {
        throw Exception('Expected a list but got something else');
      }
    } catch (e, stacktrace) {
      log('Error fetching videos: $e');
      log('Stacktrace: $stacktrace');
      rethrow;
    }
  }
}
