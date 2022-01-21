import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final String image;

  const Logo({ Key? key, required this.image }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      height: 65,
      width: 55,
      fit: BoxFit.cover,
    );
  }
}
