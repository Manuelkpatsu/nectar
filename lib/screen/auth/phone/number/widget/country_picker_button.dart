import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nectar/screen/auth/phone/number/widget/flag_image.dart';

class CountryPickerButton extends StatelessWidget {
  final GestureTapCallback? onTap;
  final ValueListenable<String> countryFlagListenable;

  const CountryPickerButton({
    Key? key,
    required this.onTap,
    required this.countryFlagListenable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: InkWell(
        onTap: onTap,
        child: Ink(
          height: 50,
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FlagImage(countryFlagListenable: countryFlagListenable),
              const Icon(
                Icons.arrow_drop_down,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
