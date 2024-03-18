import 'package:dio/dio.dart';

import 'model/post_model.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<Post>> fetchPosts() async {
    final response =
        await _dio.get('https://jsonplaceholder.typicode.com/posts');
    final List<dynamic> data = response.data;
    return data.map((json) => Post.fromJson(json)).toList();
  }
}
