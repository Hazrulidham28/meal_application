import 'package:flutter/material.dart';
import 'package:meal_application/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(primarySwatch: Colors.blue),
      //what screen will be load or root screen
      home: CategoriesScreen(),
    );
  }
}
