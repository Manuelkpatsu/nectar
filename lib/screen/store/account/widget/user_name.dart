import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nectar/theme/app_color.dart';
import 'package:nectar/theme/styles.dart';

class UserName extends StatelessWidget {
  final ValueListenable<String?> nameListenable;

  const UserName({
    Key? key,
    required this.nameListenable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String?>(
      valueListenable: nameListenable,
      builder: (context, name, child) {
        return Text(
          name ?? '',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: mediumStyle.copyWith(
            color: AppColor.mainTextColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        );
      }
    );
  }
}
