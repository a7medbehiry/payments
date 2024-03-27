import 'dart:developer';

import 'package:check_app/Features/checkout/data/models/amount_model/amount_model.dart';
import 'package:check_app/Features/checkout/data/models/amount_model/details.dart';
import 'package:check_app/Features/checkout/data/models/item_list_model/item_list_model.dart';
import 'package:check_app/Features/checkout/data/models/item_list_model/oreder_item_model.dart';
import 'package:check_app/Features/checkout/data/models/payment_intent_input_model.dart';
import 'package:check_app/Features/checkout/presentation/manager/cubit/payment_cubit.dart';
import 'package:check_app/Features/checkout/presentation/views/thank_you_view.dart';
import 'package:check_app/core/utils/api_keys.dart';
import 'package:check_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

class CustomBottomBlocConsumer extends StatelessWidget {
  const CustomBottomBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) {
                return const ThankYouView();
              },
            ),
          );
        }
        if (state is PaymentFailure) {
          Navigator.of(context).pop();
          SnackBar snackBar = SnackBar(
            content: Text(state.errorMessage),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return CustomButton(
          onTap: () {
            PaymentIntentInputModel paymentIntentInputModel =
                PaymentIntentInputModel(
              amount: '100',
              currency: 'USD',
              customerId: 'cus_P9ibBq6SIY2GQ5',
            );
            BlocProvider.of<PaymentCubit>(context)
                .makePayment(paymentIntentInputModel: paymentIntentInputModel);

            // var transactionsData = getTransactionsData();
            // executePayPalPayment(context, transactionsData);
          },
          isLoading: state is PaymentLoading ? true : false,
          text: 'Continue',
        );
      },
    );
  }

  void executePayPalPayment(BuildContext context,
      ({AmountModel amount, ItemListModel itemList}) transactionsData) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => PaypalCheckoutView(
          sandboxMode: true,
          clientId: ApiKeys.clientId,
          secretKey: ApiKeys.paypalSecretKey,
          transactions: [
            {
              "amount": transactionsData.amount.toJson(),
              "description": "The payment transaction description.",
              "item_list": transactionsData.itemList.toJson(),
            }
          ],
          note: "Contact us for any questions on your order.",
          onSuccess: (Map params) async {
            log("onSuccess: $params");
            Navigator.pop(context);
          },
          onError: (error) {
            log("onError: $error");
            Navigator.pop(context);
          },
          onCancel: () {
            log('cancelled:');
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  ({AmountModel amount, ItemListModel itemList}) getTransactionsData() {
    var amountModel = AmountModel(
      total: '100',
      currency: 'USD',
      details: Details(
        shipping: '0',
        shippingDiscount: 0,
        subtotal: '100',
      ),
    );

    List<OrderItemModel> orderItemModel = [
      OrderItemModel(
        currency: 'USD',
        name: 'Apple',
        quantity: 4,
        price: '10',
      ),
      OrderItemModel(
        currency: 'USD',
        name: 'Orange',
        quantity: 5,
        price: '12',
      ),
    ];
    var itemListModel = ItemListModel(
      orderItemModel: orderItemModel,
    );
    return (amount: amountModel, itemList: itemListModel);
  }
}
