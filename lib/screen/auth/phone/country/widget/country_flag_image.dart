import 'package:flutter/material.dart';

class CountryFlagImage extends StatelessWidget {
  final String image;
  
  const CountryFlagImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(3),
      child: Image.asset(
        'assets/flags/${image.toLowerCase()}.png',
        height: 24,
        width: 35,
        fit: BoxFit.cover,
      ),
    );
  }
}
