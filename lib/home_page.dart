import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:streamsurg/payment_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PaymentController controller = Get.put(PaymentController());
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              // controller.makePayment(amount: '5', currency: 'USD');
              payNow() async {
                try{
                  // Map<String, dynamic> stripeData = widget.paymentData;
                  // print("stripeData===== ${stripeData['stripeCustomerId']}");
                  Stripe.publishableKey = "pk_test_51M3F5VSA7IT20Sm1kzjuHpIH3FOJfNb8nGsIpdoHccg27tiW6NGpj3DVLFtRtH9ZKTmJYaSB0ofR0ZDmJL1ndxhT00Fagq7X79";
                  Stripe.merchantIdentifier = "";
                  await Stripe.instance.applySettings();
                  await Stripe.instance.initPaymentSheet(
                    paymentSheetParameters: const SetupPaymentSheetParameters(
                        // paymentIntentClientSecret: stripeData['paymentIntentSecret'],
                        merchantDisplayName: 'Courses',
                        // customerId: stripeData['stripeCustomerId'],
                        // customerEphemeralKeySecret: stripeData['ephemeralKey'],
                      applePay: PaymentSheetApplePay(
                        merchantCountryCode: 'US',
                      ),
                      googlePay: PaymentSheetGooglePay(
                        merchantCountryCode: 'US',
                        testEnv: true,
                      ),
                    ),
                  );
                  await Stripe.instance.presentPaymentSheet();
                  // widget.submitData();
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
                  rethrow;
                }

              }
            },
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Make Payment',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}