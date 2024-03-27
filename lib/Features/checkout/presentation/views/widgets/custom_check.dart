import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomCheck extends StatelessWidget {
  const CustomCheck({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50,
      backgroundColor: const Color(0xFFD9D9D9),
      child: CircleAvatar(
        radius: 40,
        backgroundColor: const Color(0xFF34A853),
        child: Center(
          child: SvgPicture.asset(
            'assets/images/check.svg',
            height: 32,
          ),
        ),
      ),
    );
  }
}
