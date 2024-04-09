import 'package:flutter/material.dart';
import 'package:meal_application/dummy_data.dart';
import 'package:meal_application/screen/categories_screen.dart';
import 'package:meal_application/screen/category_meals_screen.dart';
import 'package:meal_application/screen/filter_screen.dart';
import 'package:meal_application/screen/meal_detail_screen.dart';
import 'package:meal_application/screen/tabs_screen.dart';
import 'models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      //replace the filters data
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        //var result = true;

        if (_filters['gluten']! && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose']! && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan']! && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian']! && !meal.isVegetarian) {
          return false;
        }
        return true;

        //return result;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyLarge: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyMedium: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              titleMedium: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      //what screen will be load or root screen
      //home: CategoriesScreen(),

      //for the named routes
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (context) => MealDetailScreen(),
        //pass the function's pointer to the filterscreen class
        FilterScreen.routeName: (context) =>
            FilterScreen(_filters, _setFilters),
      },

      //any route that are not registered in named routes
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => CategoriesScreen(),
        );
      },
      //unknown page or screen
      //onUnknownRoute: (settings){builder: (ctx) => CategoriesScreen(),},
    );
  }
}
