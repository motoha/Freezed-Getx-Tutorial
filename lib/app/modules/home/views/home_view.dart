import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tutorial_series/app/modules/Post/views/post_view.dart';

import '../../dynamicTab/views/dynamic_tab_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                'List Of Tutorial Series',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Get.to(const PostView());
                  },
                  child: const Text("Freezed Getx Fecth API")),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    Get.to(const DynamicTab());
                  },
                  child: const Text("Dynamic Nested Tabs"))
            ],
          ),
        ),
      ),
    );
  }
}
