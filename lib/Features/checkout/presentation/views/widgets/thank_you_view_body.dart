import 'package:check_app/Features/checkout/presentation/views/widgets/custom_check.dart';
import 'package:check_app/Features/checkout/presentation/views/widgets/custom_dashed_line.dart';
import 'package:check_app/Features/checkout/presentation/views/widgets/thank_you_card.dart';
import 'package:flutter/material.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const ThankYouCard(),
          Positioned(
            // 20 is the radius of circle
            left: 8 + 20,
            right: 8 + 20,
            bottom: MediaQuery.sizeOf(context).height * .2 + 20,
            child: const CustomDashedLine(),
          ),
          Positioned(
            bottom: MediaQuery.sizeOf(context).height * .2,
            left: -20,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
            ),
          ),
          Positioned(
            bottom: MediaQuery.sizeOf(context).height * .2,
            right: -20,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
            ),
          ),
          const Positioned(
            left: 0,
            right: 0,
            top: -50,
            child: CustomCheck(),
          )
        ],
      ),
    );
  }
}
