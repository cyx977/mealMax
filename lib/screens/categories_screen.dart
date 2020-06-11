import 'package:flutter/material.dart';
import '../widgets/category_item.dart';
import '../dummy_data.dart';
import '../model/category.dart';

class CategoriesScreen extends StatelessWidget {
  static String route = "/categoriesScreen";
  @override
  Widget build(BuildContext context) {
    print("CategoriesScreen build");
    return SafeArea(
        child: GridView(
          padding: EdgeInsets.all(25.0),
          children: [
            ...DUMMY_CATEGORIES.map(
              (Category category) => CategoryItem(
                color: category.color,
                id: category.id,
                title: category.title,
              ),
            ),
          ],
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
        ),
      );
  }
}
