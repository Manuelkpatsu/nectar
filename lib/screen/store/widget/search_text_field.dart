import 'package:flutter/material.dart';
import 'package:nectar/theme/app_color.dart';
import 'package:nectar/theme/styles.dart';

import 'clear_search_query_button.dart';
import 'search_icon.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController controller;
  final void Function()? onPressed;
  final ValueChanged<String>? onChanged;
  final String hintText;

  const SearchTextField({
    Key? key,
    required this.controller,
    required this.onPressed,
    required this.onChanged,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16),
      child: TextField(
        cursorColor: AppColor.primaryColor,
        controller: controller,
        autofocus: false,
        textInputAction: TextInputAction.search,
        textCapitalization: TextCapitalization.sentences,
        style: normalStyle.copyWith(
          color: AppColor.mainTextColor,
          fontWeight: FontWeight.w600,
        ),
        decoration: InputDecoration(
          prefixIcon: const SearchIcon(),
          suffixIcon: ClearSearchQueryButton(onPressed: onPressed),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: AppColor.greyBackgroundColor,
          hintText: hintText,
          hintStyle: normalStyle.copyWith(
            color: AppColor.mainGreyTextColor,
            fontWeight: FontWeight.w600,
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5)
        ),
        onChanged: (queryString) => onChanged!(queryString),
      ),
    );
  }
}
