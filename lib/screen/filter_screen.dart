import 'package:flutter/material.dart';
import 'package:meal_application/widgets/main_drawer.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});
  static const routeName = '/filters';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter screen'),
      ),
      body: const Center(
        child: Text('Filter'),
      ),
      drawer: MainDrawer(),
    );
  }
}
