import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '/widgets/categories_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoneMeals'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(25),
        children: DUMMY_CATE
            .map((cateData) => CategoryItem(
                  cateData.id,
                  cateData.title,
                  cateData.color,
                  
                ))
            .toList(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            childAspectRatio: 3 / 2),
      ),
    );
  }
}
