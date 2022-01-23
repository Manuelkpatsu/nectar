import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const CircularButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        minimumSize: const Size(65, 65),
      ),
      child: const Icon(Icons.chevron_right),
    );
  }
}
