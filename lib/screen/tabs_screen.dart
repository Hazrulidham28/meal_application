import 'package:flutter/material.dart';
import 'package:meal_application/screen/categories_screen.dart';
import 'package:meal_application/screen/favourite_screen.dart';
import 'package:meal_application/widgets/main_drawer.dart';
import 'package:meal_application/models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;
  const TabsScreen(this.favouriteMeals);

  @override
  State<TabsScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabsScreen> {
  //list of maps
  List<Map<String, Object>>? _pages;
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    //manage widgets to be rendered

    setState(() {
      _selectedPageIndex = index;
    });
  }

//run before build executed
  @override
  void initState() {
    // TODO: implement initState

    _pages = [
      {'page': CategoriesScreen(), 'title': 'Categoreis'},
      {
        'page': FavouritesScreen(widget.favouriteMeals),
        'title': 'Your Favourite'
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //using top tab controller
    /* return DefaultTabController(
      length: 2,
      //select initial page using initial index
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
    );*/

    return Scaffold(
      appBar: AppBar(
        title: Text(_pages![_selectedPageIndex]['title'].toString()),
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: _pages![_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.white,
        //bottom navigation bar type
        type: BottomNavigationBarType.shifting,

        //feed information which tab is selected

        currentIndex: _selectedPageIndex,
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              label: 'Category'),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            label: 'Favourites',
          ),
        ],
      ),
    );
  }
}
