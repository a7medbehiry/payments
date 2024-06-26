import 'package:check_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CheckItemInfo extends StatelessWidget {
  const CheckItemInfo({super.key, required this.title, required this.value});

  final String title, value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: Styles.style18,
        ),
        Text(
          value,
          style: Styles.styleSemiBold18,
        ),
      ],
    );
  }
}
