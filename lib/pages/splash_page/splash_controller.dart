import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../navigation/app_route_maps.dart';
import '../../network_api/const.dart';
import '../../utils/app_strings.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    initOneSignal();
    Future.delayed(const Duration(seconds: 2),
        AppRouteMaps.goToSlidePage
    );
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

}
