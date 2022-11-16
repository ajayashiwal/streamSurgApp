import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPageController extends GetxController {
  TextEditingController phoneNoController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isObscure = true;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/userinfo.profile',
    ],
  );


  // google sign in
  Future<void> googleSignIn() async {
    try {
       await _googleSignIn.signIn().then((GoogleSignInAccount? acc) async {
        final GoogleSignInAuthentication auth = await acc!.authentication;
        _googleSignIn.disconnect();
        if (kDebugMode) {
          print("Auth token ${auth.idToken}");
          print("Access token ${auth.accessToken}");
          print("google user ${acc.email}");
          print("google id ${acc.id}");
        }
      });
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
  }
// Facebook sign in
  void signInFb(BuildContext context) async {
    final fbLogin = FacebookLogin();
    final FacebookLoginResult result = await fbLogin.logIn(
        permissions: [
      FacebookPermission.publicProfile,
      FacebookPermission.email
    ]);
    final email = await fbLogin.getUserEmail();
    // final profile = await fbLogin.getUserProfile();
    // final FacebookAccessToken? accessToken = result.accessToken;
    // final imageUrl = await fbLogin.getProfileImageUrl(width: 100);
    if (email != null)
      // ignore: curly_braces_in_flow_control_structures
      if (kDebugMode) {
        print("facebook email:$email");
        // print('Facebook Error= $result');
        // print('Facebook Error>>= ${result.error}');
        // print('Status ${result.status.name}');
        // print('Access token: ${accessToken!.token}');
        // print(' ${profile!.name}! You ID: ${profile.userId}');
        // print('Your profile image: $imageUrl');
      }
  }



}
