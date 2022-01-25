import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final ValueListenable<String?> imageListenable;

  const ProfileImage({
    Key? key,
    required this.imageListenable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(27)),
      child: ValueListenableBuilder<String?>(
        valueListenable: imageListenable,
        builder: (context, image, child) {
          return Image.asset(
            image != null
                ? 'assets/images/$image.png'
                : 'assets/images/logo.png',
            height: 65,
            width: 65,
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}
