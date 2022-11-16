import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PaymentController extends GetxController {
  Map<String, dynamic>? paymentIntentData;
  

  Future<void> makePayment(
      {required String amount, required String currency}) async {
    try {
      paymentIntentData = await createPaymentIntent(amount, currency);
      if (paymentIntentData != null) {
        await Stripe.instance.initPaymentSheet(
            paymentSheetParameters: SetupPaymentSheetParameters(
              // googlePay: true,
              // applePay: PaymentSheetApplePay(merchantCountryCode: "US",),
              // applePay: PaymentSheetApplePay.fromJson({
              //   "merchantCountryCode":"US",
              // }),
              // customFlow: true,
              // allowsDelayedPaymentMethods: true,
              // testEnv: true,
              // merchantCountryCode: 'US',
              applePay: const PaymentSheetApplePay(
                merchantCountryCode: 'US',
              ),
              googlePay: const PaymentSheetGooglePay(
                merchantCountryCode: 'US',
                testEnv: true,
              ),
              style: ThemeMode.system,

              // Merchant Name

              merchantDisplayName: 'TEST',
              customerId: paymentIntentData!['customer'],
              paymentIntentClientSecret: paymentIntentData!['client_secret'],
              customerEphemeralKeySecret: paymentIntentData!['ephemeralKey'],
            )
        );
        displayPaymentSheet();
      }
    } catch (e, s) {
      if (kDebugMode) {
        print('exception:$e$s');
      }
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      Get.snackbar('Payment', 'Payment Successful',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          margin: const EdgeInsets.all(10),
          duration: const Duration(seconds: 2));
    } on Exception catch (e) {
      if (e is StripeException) {
        if (kDebugMode) {
          print("Error from Stripe: ${e.error.localizedMessage}");
        }
      } else {
        if (kDebugMode) {
          print("Unforeseen error: $e");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("exception:$e");
      }
    }
  }


  //  Future<Map<String, dynamic>>
  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card'
      };
      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            'Authorization': 'sk_test_51M3F5VSA7IT20Sm1HCGNPf9Ketacsmt7TD0qnvfkLwuFd6V7NafYyy9AcvYCs9Av8hY6sdxLrvKxqUeT21nF2OXD00uyj4VXbN',
            'Content-Type': 'application/x-www-form-urlencoded'
          });
      return jsonDecode(response.body);
    } catch (err) {
      if (kDebugMode) {
        print('err charging user: ${err.toString()}');
      }
    }
  }

  calculateAmount(String amount) {
    final a = (int.parse(amount)) * 100;
    return a.toString();
  }
}