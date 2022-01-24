import 'package:flutter/material.dart';
import 'package:nectar/theme/styles.dart';

class Util {
  /// Shows a snackbar
  static void showSnackbar(BuildContext context, String text) {
    final snackbar = SnackBar(
      content: Text(
        text,
        style: normalStyle.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.black,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
