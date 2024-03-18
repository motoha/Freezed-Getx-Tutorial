import 'dart:ffi';

import 'package:get/get.dart';
import 'package:tutorial_series/app/modules/Post/api_service.dart';

import '../model/post_model.dart';

class PostController extends GetxController {
  //fetch sample api
  final ApiService _apiService = ApiService();
  final posts = <Post>[].obs;

  void fetchPost() async {
    final fetchpost = await _apiService.fetchPosts();

    posts.value = fetchpost;
  }

  @override
  void onInit() {
    fetchPost();
    super.onInit();
  }
}
