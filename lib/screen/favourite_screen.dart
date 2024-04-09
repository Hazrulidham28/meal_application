import 'package:flutter/material.dart';
import 'package:meal_application/models/meal.dart';
import 'package:meal_application/widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal>? favouriteMeals;

  const FavouritesScreen(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favouriteMeals!.isEmpty) {
      return const Center(
        child: Text('You have no favourites yet - Start adding some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          //parameter to be passed to meal item
          return MealItem(
            id: favouriteMeals![index].id,
            title: favouriteMeals![index].title,
            imageUrl: favouriteMeals![index].imageUrl,
            affordability: favouriteMeals![index].affordability,
            complexity: favouriteMeals![index].complexity,
            duration: favouriteMeals![index].duration,
            // removeItem: (_) {},
          );
        },
        itemCount: favouriteMeals!.length,
      );
    }
  }
}
