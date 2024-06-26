import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomCartInfo extends StatelessWidget {
  const CustomCartInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 305,
      height: 73,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 23,
          vertical: 16,
        ),
        child: Row(
          children: [
            SvgPicture.asset('assets/images/master_card.svg'),
            const SizedBox(
              width: 23,
            ),
            Text.rich(
              TextSpan(
                children: [
                  const TextSpan(
                    text: 'Credit Card ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  TextSpan(
                    text: 'Mastercard **78 ',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.699999988079071),
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
