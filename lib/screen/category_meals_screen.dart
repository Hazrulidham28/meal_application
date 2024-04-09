// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:meal_application/widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> availableMeals;

  const CategoryMealsScreen(this.availableMeals);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  //final String categoryId;
  String? categoryTitle;
  List<Meal>? displayedMeals;
  var _loadedInitData = false;

  //to run this first before build method
  //run before widget has been created and no context yet
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  //initstate has no context
  //use this instead
  @override
  void didChangeDependencies() {
    //TODO: implement didChangeDependencies

    //condition if data is not loaded
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];

      //use the data that passed throuhg main dart
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }

    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals!.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          //parameter to be passed to meal item
          return MealItem(
            id: displayedMeals![index].id,
            title: displayedMeals![index].title,
            imageUrl: displayedMeals![index].imageUrl,
            affordability: displayedMeals![index].affordability,
            complexity: displayedMeals![index].complexity,
            duration: displayedMeals![index].duration,
            removeItem: _removeMeal,
          );
        },
        itemCount: displayedMeals!.length,
      ),
    );
  }
}
