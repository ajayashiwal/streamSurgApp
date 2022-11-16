import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:streamsurg/navigation/app_pages.dart';
import 'package:streamsurg/network_api/const.dart';
import 'package:streamsurg/pages/splash_page/splash_binding.dart';
import 'package:streamsurg/utils/app_strings.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = 'pk_test_51M3F5VSA7IT20Sm1kzjuHpIH3FOJfNb8nGsIpdoHccg27tiW6NGpj3DVLFtRtH9ZKTmJYaSB0ofR0ZDmJL1ndxhT00Fagq7X79'; // Replace with your publishable key
  await Stripe.instance.applySettings();
  await Firebase.initializeApp();
  FlutterError.onError=FirebaseCrashlytics.instance.recordFlutterError;
  initOneSignal();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: SplashBinding(),
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      getPages: AppPages.pages,
      initialRoute: AppPages.initial,
    );
  }


}
Future<void> initOneSignal() async {
  await OneSignal.shared.setAppId(Constants.oneSignalAppId);
  final status = await OneSignal.shared.getDeviceState();
  final String? osUserID = status?.userId;
  if (kDebugMode) {
    print("osUserID=> $osUserID");
  }
  final prefs = await SharedPreferences.getInstance();
  // await prefs.setString(AppStrings.projectId, "2");
  if(osUserID!=null) {
    prefs.setString(AppStrings.UserID, osUserID);

  }
  await OneSignal.shared.promptUserForPushNotificationPermission(
    fallbackToSettings: false,

  );
  OneSignal.shared.setNotificationOpenedHandler((OSNotificationOpenedResult result) {
    if (kDebugMode) {
      print('NOTIFICATION OPENED HANDLER CALLED WITH: $result');
      print("addinal data ${result.notification.additionalData}");
    }

    var data = json.encode(result.notification.additionalData);
    if (kDebugMode) {
      print("al;sfd'..$data");
    }


    Map p = jsonDecode(data);
    if (kDebugMode) {
      print("al;sfd'..${p['notification_id'].toString()}");
      print("type;sfd'..${p['type'].toString()}");
    }

    prefs.setString("NotificationId", p['notification_id'].toString());
    // prefs.setString("NotificationType", p['type'].toString());
    if (kDebugMode) {
      print("al;sfd'..${prefs.getString("NotificationId")}");
    }

    // NotificationClick.onClick(p['id'].toString(), p['type']);
  });
}

// import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:get/get.dart';
// import 'package:streamsurg/home_page.dart';
// import 'package:streamsurg/stripe_hone_page.dart';
//
// void main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   Stripe.publishableKey = 'pk_test_51M3F5VSA7IT20Sm1kzjuHpIH3FOJfNb8nGsIpdoHccg27tiW6NGpj3DVLFtRtH9ZKTmJYaSB0ofR0ZDmJL1ndxhT00Fagq7X79'; // Replace with your publishable key
//   // Stripe.merchantIdentifier = 'merchant.flutter.stripe.test';
//   // Stripe.urlScheme = 'flutterstripe';
//   await Stripe.instance.applySettings();
//
//   runApp(GetMaterialApp(
//     initialRoute: '/',
//     //fade in transition
//     transitionDuration: const Duration(milliseconds: 500),
//     defaultTransition: Transition.fadeIn,
//
//     debugShowCheckedModeBanner: false,
//     home: HomePageStripe()
//     // getPages: [
//     //   GetPage(
//     //     name: '/',
//     //     page: () => const HomePage(),
//     //   ),
//     // ],
//   ));
// }



// import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//
//   // set the publishable key for Stripe - this is mandatory
//   Stripe.publishableKey = "pk_test_51M3F5VSA7IT20Sm1kzjuHpIH3FOJfNb8nGsIpdoHccg27tiW6NGpj3DVLFtRtH9ZKTmJYaSB0ofR0ZDmJL1ndxhT00Fagq7X79";
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: PaymentScreen(),
//     );
//   }
// }
//
//
// // payment_screen.dart
// class PaymentScreen extends StatelessWidget {
//   final billingDetails = BillingDetails(
//     email: 'email@stripe.com',
//     phone: '+48888000888',
//     address: Address(
//       city: 'Houston',
//       country: 'US',
//       line1: '1459 Circle Drive',
//       line2: '',
//       state: 'Texas',
//       postalCode: '77063',
//     ),
//   );
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Container(
//         alignment: Alignment.center,
//         padding: EdgeInsets.all(16),
//         child: Column(
//           children: [
//             CardField(
//               onCardChanged: (card) {
//                 print(card);
//               },
//             ),
//             TextButton(
//               onPressed: () async {
//                 // create payment method
//                 final paymentMethod =
//                 await Stripe.instance.createPaymentMethod(params: PaymentMethodParams.card(paymentMethodData: PaymentMethodData(billingDetails: billingDetails),
//                 ));
//               },
//               child: Text('pay'),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }







// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';
// import 'package:streamsurg/widgets/my_flow_deleate.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: FlowExample(),
//     );
//   }
// }
//
//
//
// class Cart extends StatefulWidget {
//
//
//   @override
//   _CartState createState() => _CartState();
// }
//
// class _CartState extends State<Cart> {
//   Razorpay? _razorpay;
//
//   @override
//   void initState() {
//     super.initState();
//     _razorpay = Razorpay();
//     _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
//     _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
//     _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     _razorpay!.clear();
//   }
//
//   void openCheckout() async {
//     var options = {
//       'key': 'rzp_test_NNbwJ9tmM0fbxj',
//       'amount': 28200,
//       'name': 'Shaiq',
//       'description': 'Payment',
//       'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
//       'external': {
//         'wallets': ['paytm']
//       }
//     };
//
//     try {
//       _razorpay.open(options);
//     } catch (e) {
//       debugPrint(e);
//     }
//   }
//
//   void _handlePaymentSuccess(PaymentSuccessResponse response) {
//     Fluttertoast.showToast(
//         msg: "SUCCESS: ${response.paymentId}", timeInSecForIosWeb: 4);
//   }
//
//   void _handlePaymentError(PaymentFailureResponse response) {
//     Fluttertoast.showToast(
//         msg: "ERROR: " + response.code.toString() + " - " + response.message.toString(), timeInSecForIosWeb: 4);
//   }
//
//   void _handleExternalWallet(ExternalWalletResponse response) {
//     Fluttertoast.showToast(
//         msg: "EXTERNAL_WALLET: ${response.walletName}", timeInSecForIosWeb: 4);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BaseView<CartViewModel>(
//         onModelReady: (model) {},
//         builder: (context, model, build) {
//           return Scaffold(
//             appBar: AppBar(
//               backgroundColor: Colors.white,
//               elevation: 0.0,
//               centerTitle: true,
//               leading: IconButton(
//                 icon: Icon(Icons.arrow_back, color: Color(0xFF545D68)),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//               title: Text('Cart',
//                   style: TextStyle(
//                       fontSize: 20.0,
//                       color: Color(0xFF545D68))),
//               actions: <Widget>[
//                 IconButton(
//                   icon: Icon(
//                       Icons.notifications_none, color: Color(0xFFF17532)),
//                   onPressed: () {},
//                 ),
//               ],
//             ),
//
//             body: ListView(
//                 children: [
//                   SizedBox(height: 15.0),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Card(
//                       child: Row(
//                         children: <Widget>[
//                           SizedBox(height: 15.0),
//                           Hero(
//                               tag: 'assets/browniecookies.jpg',
//                               child: Image.asset('assets/browniecookies.jpg',
//                                   height: 90.0,
//                                   width: 90.0,
//                                   fit: BoxFit.contain
//                               )
//                           ),
//                           SizedBox(width: 20.0),
//                           Column(
//                             children: <Widget>[
//                               Text('\$3.99',
//                                   style: TextStyle(
//                                       fontSize: 22.0,
//                                       fontWeight: FontWeight.bold,
//                                       color: Color(0xFFF17532))),
//                               SizedBox(height: 10.0),
//                               Text('brownie cookies',
//                                   style: TextStyle(
//                                       color: Color(0xFF575E67),
//                                       fontSize: 24.0)),
//                             ],
//                           ),
//
//                         ],
//                       ),
//                     ),
//                   ),
//
//                   SizedBox(height: 20.0),
//                   InkWell(
//                       onTap: () {
//                         openCheckout();
//                       },
//                       child: Padding(
//                         padding: const EdgeInsets.only(left:18.0,right: 18),
//                         child: Container(
//                             width: MediaQuery
//                                 .of(context)
//                                 .size
//                                 .width - 50.0,
//                             height: 50.0,
//                             decoration: BoxDecoration(
//                                 borderRadius:
//                                 BorderRadius.circular(25.0),
//                                 color: Color(0xFFF17532)),
//                             child: Center(
//                                 child: Text('Checkout',
//                                     style: TextStyle(
//                                         fontFamily: 'nunito',
//                                         fontSize: 14.0,
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.white)))),
//                       ))
//
//                 ]
//             ),
//
//
//           );
//         }
//     );
//   }
// }
/*
class FlowDemo extends StatelessWidget {
  const FlowDemo ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    floatingActionButton: LinearFlowWidget()
    );
  }
}*/
