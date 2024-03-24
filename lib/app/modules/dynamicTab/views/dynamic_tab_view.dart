import 'dart:convert';

import 'package:flutter/material.dart';
import '../../dynamicTab/model/category.dart';
//to do
// 1. add SingleTickerProviderStateMixin
// 2. Create tab controller
// 3. create model
// 4. import json
// 5. finish

const String jsonData = ''' 
 [
    {
      "categoryName": "Sport",
      "items": [
        {"name": "Football"},
        {"name": "Basketball"},
        {"name": "Voley"}
      ]
    },
    {
      "categoryName": "Film",
       "items": [
        {"name": "Action"},
        {"name": "Fiction"},
        {"name": "Non Fiction"}
      ]
    }
  ]
''';

class DynamicTab extends StatefulWidget {
  const DynamicTab({super.key});

  @override
  State<DynamicTab> createState() => _DynamicTabState();
}

class _DynamicTabState extends State<DynamicTab>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  List<CategoryTab> categories = (jsonDecode(jsonData) as List)
      .map((data) => CategoryTab.fromJson(data))
      .toList();

  @override
  void initState() {
    _tabController = TabController(length: categories.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dynamic Tabs'),
        bottom: TabBar(
          controller: _tabController,
          tabs: categories
              .map((category) => Tab(text: category.categoryName))
              .toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: categories.map((category) {
          return ListView.builder(
            itemCount: category.items.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(category.items[index].name),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
