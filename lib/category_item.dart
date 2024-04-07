import 'package:flutter/material.dart';
import 'package:meal_application/categories_screen.dart';
import 'package:meal_application/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String Id;
  final String title;
  final Color color;

  // ignore: use_key_in_widget_constructors
  CategoryItem(this.title, this.color, this.Id);

  void selectCategory(BuildContext ctx) {
    //class build into flutter to navigate into screen
    Navigator.of(ctx).pushNamed(CategoryMealsScreen.routeName, arguments: {
      'id': Id,
      'title': title,
    });
  }
  /*void selectCategory(BuildContext ctx) {
    //class build into flutter to navigate into screen
    Navigator.of(ctx).push(MaterialPageRoute(
      builder: (_) {
        return CategoryMealsScreen(Id, title);
      },
    ));
  }*/

  @override
  Widget build(BuildContext context) {
    //to make the container tappable
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
