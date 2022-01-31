import 'package:flutter/material.dart';
import 'package:nectar/screen/store/cart/widget/checkout_title.dart';
import 'package:nectar/screen/store/cart/widget/delivery.dart';
import 'package:nectar/screen/store/cart/widget/payment.dart';
import 'package:nectar/screen/store/cart/widget/place_order_button.dart';
import 'package:nectar/screen/store/cart/widget/promo.dart';
import 'package:nectar/screen/store/cart/widget/terms_conditions.dart';
import 'package:nectar/screen/store/cart/widget/total_cost.dart';
import 'package:nectar/screen/widget/app_divider.dart';
import 'package:nectar/theme/app_color.dart';

class CheckoutSheet extends StatelessWidget {
  final VoidCallback? onDeliveryTap;
  final VoidCallback? onCloseCheckout;
  final VoidCallback? onPaymentTap;
  final VoidCallback? onPromoCodeTap;
  final VoidCallback? onPlaceOrderTap;
  final VoidCallback? onTermsTap;
  final VoidCallback? onConditionsTap;

  const CheckoutSheet({
    Key? key,
    required this.onDeliveryTap,
    required this.onCloseCheckout,
    this.onPaymentTap,
    this.onPromoCodeTap,
    this.onPlaceOrderTap,
    this.onTermsTap,
    this.onConditionsTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CheckoutTitle(onCloseCheckout: onCloseCheckout),
          const AppDivider(color: AppColor.dividerColor),
          Delivery(onDeliveryTap: onDeliveryTap),
          const AppDivider(
            padding: EdgeInsets.symmetric(horizontal: 16),
            color: AppColor.dividerColor,
          ),
          Payment(onPaymentTap: onPaymentTap),
          const AppDivider(
            padding: EdgeInsets.symmetric(horizontal: 16),
            color: AppColor.dividerColor,
          ),
          Promo(onPromoCodeTap: onPromoCodeTap),
          const AppDivider(
            padding: EdgeInsets.symmetric(horizontal: 16),
            color: AppColor.dividerColor,
          ),
          const TotalCost(),
          const AppDivider(
            padding: EdgeInsets.symmetric(horizontal: 16),
            color: AppColor.dividerColor,
          ),
          const SizedBox(height: 20),
          TermsConditions(onTermsTap: onTermsTap, onConditionsTap: onConditionsTap),
          const SizedBox(height: 30),
          PlaceOrderButton(onPlaceOrderTap: onPlaceOrderTap),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
