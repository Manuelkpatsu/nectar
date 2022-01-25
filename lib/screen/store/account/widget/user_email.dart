import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nectar/theme/app_color.dart';
import 'package:nectar/theme/styles.dart';

class UserEmail extends StatelessWidget {
  final ValueListenable<String?> emailListenable;

  const UserEmail({
    Key? key,
    required this.emailListenable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String?>(
      valueListenable: emailListenable,
      builder: (context, email, child) {
        return Text(
          email ?? '',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: normalStyle.copyWith(
            color: AppColor.mainGreyTextColor,
          ),
        );
      },
    );
  }
}
