import 'package:flutter/material.dart';
import 'package:meal_application/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  final Function toggleFav;
  final Function isFavourite;

  const MealDetailScreen(this.toggleFav, this.isFavourite);

  static const routeName = '/meal-detail';

  Widget buildSectionTitle(BuildContext context, text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 170,
      width: 350,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              buildSectionTitle(context, 'Ingredients'),
              buildContainer(
                ListView.builder(
                  itemBuilder: (ctx, index) => Card(
                    color: Theme.of(context).primaryColor,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Text(
                        selectedMeal.ingredients[index],
                      ),
                    ),
                  ),
                  itemCount: selectedMeal.ingredients.length,
                ),
              ),
              buildSectionTitle(context, 'Steps'),
              buildContainer(
                ListView.builder(
                  itemBuilder: (ctx, index) => Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('#${index + 1}'),
                        ),
                        title: Text(selectedMeal.steps[index]),
                      ),
                    ],
                  ),
                  itemCount: selectedMeal.steps.length,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //pop remove current screen and go back to previous screen
            Navigator.of(context).pop(mealId);
            //.pop parameter will pass the mealId
          },
          child: const Icon(Icons.delete),
        ),
        appBar: AppBar(
          title: Text(
            '${selectedMeal.title}',
          ),
          actions: [
            GestureDetector(
              onTap: () => toggleFav(mealId),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Icon(
                  isFavourite(mealId) ? Icons.star : Icons.star_border_outlined,
                ),
              ),
            ),
          ],
        ));
  }
}
