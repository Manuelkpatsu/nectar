import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FlagImage extends StatelessWidget {
  final ValueListenable<String> countryFlagListenable;
  
  const FlagImage({Key? key, required this.countryFlagListenable}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(3),
      child: ValueListenableBuilder<String>(
        valueListenable: countryFlagListenable,
        builder: (context, countryCode, child) {
          return Image.asset(
            'assets/flags/${countryCode.toLowerCase()}.png',
            height: 24,
            width: 35,
            fit: BoxFit.cover,
          );
        }
      ),
    );
  }
}
