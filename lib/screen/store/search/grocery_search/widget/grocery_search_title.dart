import 'package:flutter/material.dart';
import 'package:nectar/theme/styles.dart';

class GrocerySearchTitle extends StatelessWidget {
  final String title;

  const GrocerySearchTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: bigStyle.copyWith(
        fontSize: 20,
      ),
    );
  }
}
