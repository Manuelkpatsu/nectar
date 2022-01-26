import 'package:flutter/material.dart';

class AddToCartButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const AddToCartButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: const Icon(Icons.add),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(45, 45)
      ),
    );
  }
}
