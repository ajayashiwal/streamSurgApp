import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:streamsurg/pages/splash_page/splash_controller.dart';
import '../../appStyle/assets_images.dart';


// ignore: must_be_immutable
class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
        builder: (controller) {
          return Scaffold(
            body: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: Image.asset(AssetsBase.appIcon,fit: BoxFit.cover),
            ),

          );
        }
    );
  }

}
