import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:task_manager/app.dart';
import 'package:task_manager/ui/controler/auth_controller.dart';
import 'package:task_manager/ui/screens/sign_in_screen.dart';
import '../models/network_response.dart';

class NetworkCaller {

  static Future<NetworkResponse> getProduct({required String url}) async {
    try {
      Uri uri = Uri.parse(url);

      Map<String, String> headers ={
        'token':AuthController.accessToken.toString()
      };
      // for print information on console
      debugPrint(url);

      Response response = await get(uri, headers:headers);
      printResponse(url, response);

      final statusCode = response.statusCode;
      if (statusCode == 200) {
        final decodeData = jsonDecode(response.body);

        return NetworkResponse(
            isSuccess: true,
            ResponseCode: statusCode,
            responseData: decodeData);
      }
      else if (statusCode == 401) {
        _moveToSignInPage();
        return NetworkResponse(
            isSuccess: false,
            ResponseCode: statusCode,
            errorMessage: 'Unauthenticated..!');
      }
      else {
        return NetworkResponse(
          isSuccess: false,
          ResponseCode: statusCode,
        );
      }
    } catch (e) {
      return NetworkResponse(
        isSuccess: false,
        ResponseCode: -1,
        errorMessage: e.toString(),
      );
    }
  }

  static Future<NetworkResponse> postProduct({required String url, Map<String, dynamic>? body}) async {
    try {
      Uri uri = Uri.parse(url);
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'token': AuthController.accessToken.toString()
      };
      // for print information on console
      printRequest(url, body, headers);

      Response response =
          await post(uri, headers: headers, body: jsonEncode(body));

      // for print information on console

      printResponse(url, response);

      final statusCode = response.statusCode;
      if (statusCode == 200) {
        final decodeData = jsonDecode(response.body);

        if (decodeData['status'] == 'fail') {
          return NetworkResponse(
              isSuccess: false,
              ResponseCode: statusCode,
              errorMessage: decodeData['data']);
        }
        return NetworkResponse(
            isSuccess: true,
            ResponseCode: statusCode,
            responseData: decodeData);
      } else if (statusCode == 401) {
        _moveToSignInPage();
        return NetworkResponse(
            isSuccess: false,
            ResponseCode: statusCode,
            errorMessage: 'Unauthenticated..!');
      } else {
        return NetworkResponse(
          isSuccess: false,
          ResponseCode: statusCode,
        );
      }
    } catch (e) {
      return NetworkResponse(
        isSuccess: false,
        ResponseCode: -1,
        errorMessage: e.toString(),
      );
    }
  }

  static Future <void> _moveToSignInPage() async{
   await AuthController.clearUserData();
    Navigator.pushAndRemoveUntil(
        TaskManagerApp.NavigatorKey as BuildContext,
        MaterialPageRoute(builder: (context) => const SignInScreen()),
        (p) => false);
  }

  static void printRequest(String url, Map<String, dynamic>? body, Map<String, dynamic>? header) {
    debugPrint('REQUEST:\nURL:$url\nBODY:$body\nHEADERS;$header');
  }

  static void printResponse(String url, Response response) {
    debugPrint(
        'URL:$url\nSTATUSCODE:${response.statusCode}\nBODY;${response.body} ');
  }
}
