import 'package:flutter/material.dart';

class CategoryImage extends StatelessWidget {
  final String image;
  const CategoryImage({ Key? key, required this.image, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/categories/$image.png',
      height: 75,
      width: 100,
      fit: BoxFit.cover,
    );
  }
}
