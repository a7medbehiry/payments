import 'package:check_app/Features/checkout/presentation/views/widgets/payment_details_item.dart';
import 'package:flutter/material.dart';

class PaymentDetailsItemsListView extends StatefulWidget {
  const PaymentDetailsItemsListView({super.key});

  @override
  State<PaymentDetailsItemsListView> createState() =>
      _PaymentDetailsItemsListViewState();
}

class _PaymentDetailsItemsListViewState
    extends State<PaymentDetailsItemsListView> {
  final List<String> paymentDetailsItemsList = const [
    'assets/images/card.svg',
    'assets/images/paypal.svg',
    'assets/images/pay.svg',
  ];

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: paymentDetailsItemsList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GestureDetector(
              onTap: () {
                activeIndex = index;
                setState(() {});
              },
              child: PaymentDetailsItem(
                isActive: activeIndex == index,
                image: paymentDetailsItemsList[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
