import 'package:dio/dio.dart';
import 'package:dio_demo/models/post.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<Post>> getPosts() async {
    try {
      final response =
          await _dio.get('https://jsonplaceholder.typicode.com/posts');
      final List<dynamic> data = response.data;
      return data.map((json) => Post.fromJson(json)).toList();
    } catch (error) {
      throw Exception('Failed to load posts: $error');
    }
  }
}
