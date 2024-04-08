import 'package:flutter/material.dart';
import 'package:meal_application/screen/categories_screen.dart';
import 'package:meal_application/screen/favourite_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      //select the page using initial index
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Meals'),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: 'Categories',
              ),
              Tab(
                icon: Icon(Icons.favorite),
                text: 'Favourite',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [CategoriesScreen(), FavouritesScreen()],
        ),
      ),
    );
  }
}
