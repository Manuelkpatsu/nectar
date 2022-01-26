import 'package:flutter/material.dart';

import 'grocery_argument.dart';

class GroceryScreen extends StatefulWidget {
  final GroceryArgument argument;
  
  const GroceryScreen(this.argument, { Key? key }) : super(key: key);

  @override
  _GroceryScreenState createState() => _GroceryScreenState();
}

class _GroceryScreenState extends State<GroceryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('Grocery Screen'),
      ),
    );
  }
}
