import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'dart:async';
import 'dart:convert';

import 'package:streamsurg/network_api/api_interface.dart';
import 'package:streamsurg/network_api/const.dart';
import 'package:streamsurg/utils/app_strings.dart';

import '../widgets/toast.dart';



class NetworkUtil {
  static NetworkUtil instance = NetworkUtil.internal();
    NetworkUtil.internal();

  factory NetworkUtil() => instance;
  final JsonDecoder _decoder = const JsonDecoder();
  Future<dynamic> get(String url, ApiInterface interface) async {
    final ioc = HttpClient();
    var connectivityResult = await (Connectivity().checkConnectivity());

    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = IOClient(ioc);
    var uri =
    Uri.parse(Constants.baseUrl + url);
    if (kDebugMode) {
      print(uri);
    }
    if (connectivityResult == ConnectivityResult.none) {
      interface.onFailure("");

    }else{
    return http.get(uri, headers: {
      'Accept': 'application/json',
    }).then((response) {
      final String res = response.body;
      final int statusCode = response.statusCode;
      if (statusCode == 401) {
        interface.onTokenExpire(res);
      }
      if (statusCode < 200 || statusCode > 400) {
        interface.onFailure("");
        throw Exception(AppStrings.errorWhileFetchingData);
      }
      if (statusCode == 200) {
        var map = _decoder.convert(res);
        if (map[AppStrings.status] == 1) {
          interface.onSuccess(map, statusCode);
        } else {
          interface.onFailure(map[AppStrings.message]);
          ToastManager.errorToast(map[AppStrings.message]);
        }
      }
    });
  }
  }

  Future<dynamic> getAuth(String url, String token, ApiInterface interface) async{
    final ioc = HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = IOClient(ioc);
    var uri = Uri.parse(Constants.baseUrl + url);
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (kDebugMode) {
      print('url--------$uri');
    }
    return http.get(
      uri,
      headers: {'Authorization': 'Bearer $token', 'Accept': 'application/json'},
    ).then((response) {
      final String res = response.body;
      final int statusCode = response.statusCode;
      if (statusCode == 401) {
        interface.onTokenExpire(res);
      }
      if (statusCode < 200 || statusCode > 400) {
        throw Exception(AppStrings.errorWhileFetchingData);
      }
      if (statusCode == 200){
       interface.onSuccess(_decoder.convert(res), statusCode);
        // if(map[AppStrings.status]==1){
        //   interface.onSuccess(map, statusCode);
        // }else if(map[AppStrings.status]==0){
        //     // ToastManager.errorToast(map[AppStrings.message]);
        // }else{
        //
        // }
      }
    });
  }


  Future<dynamic> postHeaderAuth(String url, String token, ApiInterface interface, {body}) async {
    final ioc = HttpClient();
    var connectivityResult = await (Connectivity().checkConnectivity());
    ioc.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
    final httpObj = IOClient(ioc);

    var uri = Uri.parse(Constants.baseUrl + url);
    if (kDebugMode) {
      print('uri $uri');
    }
    // if (connectivityResult == ConnectivityResult.none) {
    //   interface.onFailure(AppStrings.pleaseCheckInternetConnections);
    //
    // }else{
      httpObj.post(uri, body: jsonEncode(body), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    }).then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;
      if (kDebugMode) {
        print("statusCode $statusCode");
      }
      if (kDebugMode) {
        print("res $res");
      }
      if (statusCode == 401) {
        interface.onTokenExpire(res);
      }
      if (statusCode == 200 || statusCode == 201) {
        var map=_decoder.convert(res);
        interface.onSuccess(map, statusCode);
        // if(map[AppStrings.status]==1){
        //
        // }else{
        //   throw Exception(AppStrings.errorWhileFetchingData);
        //   // interface.onFailure(map[AppStrings.message]);/
        //   // ToastManager.errorToast(map[AppStrings.message]);
        // }
      }
      if (statusCode < 200 || statusCode > 400) {
        if (kDebugMode) {
          print(res);
        }
        interface.onFailure("");
        throw Exception(AppStrings.errorWhileFetchingData);
      }
    });
  }

  Future<dynamic> post(String url, ApiInterface interface,{body}) async {
    final ioc = HttpClient();
    var connectivityResult = await (Connectivity().checkConnectivity());
    ioc.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
    final httpObj = IOClient(ioc);
    var uri = Uri.parse(Constants.baseUrl + url);
    if (connectivityResult == ConnectivityResult.none) {
      interface.onFailure(AppStrings.pleaseCheckInternetConnections);
    }else{
      httpObj.post(uri, body: body).then((http.Response response) {
        final String res = response.body;
        final int statusCode = response.statusCode;
        if (kDebugMode) {
          print('res $res');
        }
        if (statusCode == 401) {
          interface.onTokenExpire(res);
        }
        if (statusCode < 200 || statusCode > 400) {
          interface.onFailure("");
          throw Exception(AppStrings.errorWhileFetchingData);
        }
        if (statusCode == 200 || statusCode == 201) {
          var map=_decoder.convert(res);
          if(map[AppStrings.status]==1){
          interface.onSuccess(map, statusCode);
          }else{

            interface.onFailure(map[AppStrings.message]);
            ToastManager.errorToast(map[AppStrings.message]);
          }
        }
      });
    }
    if (kDebugMode) {
      print(' ${uri.toString()} ${AppStrings.body} $body');
    }


  }




}