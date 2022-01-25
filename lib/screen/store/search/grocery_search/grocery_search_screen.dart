import 'package:flutter/material.dart';

import 'grocery_search_arguments.dart';

class GrocerySearchScreen extends StatefulWidget {
  final GrocerySearchArguments? arguments;

  const GrocerySearchScreen(this.arguments, { Key? key }) : super(key: key);

  @override
  _GrocerySearchScreenState createState() => _GrocerySearchScreenState();
}

class _GrocerySearchScreenState extends State<GrocerySearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('Search Screen'),
      ),
    );
  }
}
