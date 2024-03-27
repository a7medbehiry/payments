import 'package:check_app/Features/checkout/presentation/views/widgets/payment_details_view_body.dart';
import 'package:check_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: 'Payment Details',
      ),
      body: const PaymentDetailsViewBody(),
    );
  }
}
