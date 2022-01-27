import 'package:flutter/material.dart';

class CarouselContent extends StatelessWidget {
  final String image;

  const CarouselContent({ Key? key, required this.image }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/groceries/$image.png',
      fit: BoxFit.cover,
    );
  }
}
