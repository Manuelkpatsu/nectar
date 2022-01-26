import 'package:flutter/material.dart';

class GroceryImage extends StatelessWidget {
  final String image;

  const GroceryImage({ Key? key, required this.image }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Image.asset(
        'assets/images/groceries/$image.png',
        height: 60,
        width: 100,
        fit: BoxFit.contain,
      ),
    );
  }
}
