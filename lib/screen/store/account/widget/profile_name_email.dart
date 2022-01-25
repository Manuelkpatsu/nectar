import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'user_email.dart';
import 'user_name.dart';

class ProfileNameEmail extends StatelessWidget {
  final ValueListenable<String?> emailListenable;
  final ValueListenable<String?> nameListenable;

  const ProfileNameEmail({
    Key? key,
    required this.emailListenable,
    required this.nameListenable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserName(nameListenable: nameListenable),
          UserEmail(emailListenable: emailListenable),
        ],
      ),
    );
  }
}
