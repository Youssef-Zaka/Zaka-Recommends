import 'package:flutter/material.dart';
import 'package:meals_app/Widgets/meal_item.dart';
import 'package:meals_app/dummy_data.dart';

class CattegoryMealsScreen extends StatelessWidget {
  // final String catId;
  // final String catTitle;

  // CattegoryMealsScreen(this.catId, this.catTitle);
  static const routeName = '/category_meals';
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final catTitle = routeArgs['title'];
    final catId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS
        .where(
          (element) => element.categories.contains(catId),
        )
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(catTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
              title: categoryMeals[index].title,
              imageUrl: categoryMeals[index].imageUrl,
              duration: categoryMeals[index].duration,
              complexity: categoryMeals[index].complexity,
              affordability: categoryMeals[index].affordability);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
