import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/post_controller.dart';
import '../model/post_model.dart';

class PostView extends GetView<PostController> {
  const PostView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PostController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('PostView'),
        centerTitle: true,
      ),
      body: Obx(() => ListView.builder(
            itemCount: controller.posts.length,
            itemBuilder: (context, i) {
              Post post = controller.posts[i];
              return ListTile(
                title: Text(post.title),
                subtitle: Text(post.body),
              );
            },
          )),
    );
  }
}
