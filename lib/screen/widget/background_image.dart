import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  final String image;
  final ColorFilter? colorFilter;

  const BackgroundImage({
    Key? key,
    required this.image,
    this.colorFilter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
          colorFilter: colorFilter,
        ),
      ),
    );
  }
}
