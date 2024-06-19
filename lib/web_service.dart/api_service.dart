import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio_demo/models/post.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com/")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("/posts")
  Future<List<Post>> getPosts();
}
