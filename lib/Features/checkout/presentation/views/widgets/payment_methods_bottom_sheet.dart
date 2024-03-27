import 'package:check_app/Features/checkout/presentation/views/widgets/custom_button_bloc_consumer.dart';
import 'package:check_app/Features/checkout/presentation/views/widgets/payment_details_items_list_view.dart';
import 'package:flutter/material.dart';

class PaymentMethodsBottomSheet extends StatelessWidget {
  const PaymentMethodsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 16,
          ),
          PaymentDetailsItemsListView(),
          SizedBox(
            height: 32,
          ),
          CustomBottomBlocConsumer(),
        ],
      ),
    );
  }
}
