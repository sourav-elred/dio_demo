import 'package:dio_demo/models/post.dart';
import 'package:dio_demo/web_service.dart/api_service.dart';
import 'package:flutter/material.dart';

class PostViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<Post> _posts = [];
  bool _loading = false;
  String _error = '';

  List<Post> get posts => _posts;
  bool get loading => _loading;
  String get error => _error;

  Future<void> fetchPosts() async {
    _loading = true;
    notifyListeners();

    try {
      _posts = await _apiService.getPosts();
      _error = '';
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}
