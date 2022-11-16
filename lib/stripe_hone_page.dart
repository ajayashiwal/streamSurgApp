import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;


class HomePageStripe extends StatefulWidget {
  const HomePageStripe({Key? key}) : super(key: key);

  @override
  State<HomePageStripe> createState() => _HomePageStripeState();
}

class _HomePageStripeState extends State<HomePageStripe> {
  Map<String,dynamic>? paymentIntent;
  @override
  void initState() {
    super.initState();
    // makePayment();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Stripe payment"),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Card Form",style: Theme.of(context).textTheme.headline5),
           const SizedBox(height: 20),
          CardFormField(
            enablePostalCode: true,
            autofocus: false,
            style: CardFormStyle(
              // textColor: Colors.black,
              // fontSize: 20,
              // backgroundColor: Colors.white,
              // borderColor: Colors.black,
              // cursorColor: Colors.black,
              // placeholderColor: Colors.grey,
              // textErrorColor: Colors.red,
              textColor: Colors.black,
              fontSize: 20,
              backgroundColor: Colors.transparent,
              borderColor: Colors.black,
              cursorColor: Colors.black,
              placeholderColor: Colors.grey,
              textErrorColor: Colors.red,
            ),
          ),
          // CardFormField(
          //   controller: CardFormEditController(),
          //   autofocus: false,
          //   style: CardFormStyle(
          //     cursorColor: Colors.black,
          //     backgroundColor: Colors.white,
          //     textColor: Colors.black,
          //     placeholderColor: Colors.black,
          //     borderColor: Colors.black,
          //     borderWidth: 3,
          //     borderRadius: 20
          //   ),
          // ),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: (){
                displaySheet();
                },
              child: const Text("Pay"))

        ],
      )

    );
  }

  Future<void> makePayment()async{
    try{
      paymentIntent = await createPaymentIntent("10", "USD");
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters:  SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntent!['client_secret'],
          merchantDisplayName: 'Courses',
          style: ThemeMode.light,
          // customerId: stripeData['stripeCustomerId'],
          // customerEphemeralKeySecret: stripeData['ephemeralKey'],
          // applePay: const PaymentSheetApplePay(
          //   merchantCountryCode: '+92',
          // ),
          // googlePay: const PaymentSheetGooglePay(
          //   merchantCountryCode: 'US',
          //   testEnv: true,
          // ),
        ),
      ).then((value){

      });
      displaySheet();

    }on Exception catch (e) {
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

  displaySheet()async{
    showDialog(
        context: context,
        builder:(_)=>AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: const [
                  Icon(Icons.check_circle_outline,color: Colors.green),
                  Text("Payment Successfully")
                ],
              )

            ],
          ),
        ) );
    // try{
    //   await Stripe.instance.presentPaymentSheet().then((value){
    //     showDialog(
    //         context: context,
    //         builder:(_)=>AlertDialog(
    //           content: Column(
    //             mainAxisSize: MainAxisSize.min,
    //             children: [
    //               Row(
    //                 children: const [
    //                   Icon(Icons.check_circle_outline,color: Colors.green),
    //                   Text("Payment Successfull")
    //                 ],
    //               )
    //
    //             ],
    //           ),
    //         ) );
    //     paymentIntent=null;
    //   }).onError((error, stackTrace){
    //     print("Error is ...$error $stackTrace");
    //   });
    // } on StripeException catch(e){
    //   print("Error is $e");
    //   showDialog(
    //       context: context,
    //       builder: (_)=>const AlertDialog(
    //         content: Text("Cancelled"),
    //       )
    //   );
    // }catch(e){
    //   print("$e");
    // }

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
          headers: {
            'Authorization': 'Bearer sk_test_51M3F5VSA7IT20Sm1HCGNPf9Ketacsmt7TD0qnvfkLwuFd6V7NafYyy9AcvYCs9Av8hY6sdxLrvKxqUeT21nF2OXD00uyj4VXbN',
            'Content-Type': 'application/x-www-form-urlencoded'
           },
          body: body,

          );
      if (kDebugMode) {
        print("Payment Intent Bodu...${response.body.toString()}");
      }
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
