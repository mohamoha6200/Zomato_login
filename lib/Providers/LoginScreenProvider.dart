
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../Constants.dart';
import '../Services/ApiService.dart';

import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier{

  static String phoneNumber = "kbs";
  static const phoneNumberExceed = "Phone Number Exceed Limit";
  static const defaultmsg="We need it to verify your account,and exclusively for that reason.It will never to shown on your profile.";
  static const RangeAcceptable =" "+defaultmsg;
  static const specialCharacternotallow = "Special Character are not allowed";
  final validCharacters = RegExp('[0-9]');
  final isContainSpecialCharacter=  RegExp(r'[!@#<>?":_`~;,[\]\\|=+)(*&^%\s-]');
   String dialcode='+91';
   bool isAnyError=false;
   String errMsg="";
   BuildContext context;
   bool isloading=false;
  TextEditingController textController;
  String validatePhoneNumber(String mobileNumberText) {

    /* Validation to check whether string contins special character or alphabets*/
    if (isContainSpecialCharacter.hasMatch(mobileNumberText) || !validCharacters.hasMatch(mobileNumberText)) {
      return specialCharacternotallow;
    }


    if (mobileNumberText.length > 10 && mobileNumberText.length < 14) {
      return null;
    } else if (mobileNumberText.length > 14) {
      return phoneNumberExceed;
    }else if(mobileNumberText.length <10 ){
      return defaultmsg;
    }

    return null;
  }

  refreshScreen() {
    notifyListeners();
  }

  Future<bool> login(String dialcode,String phoneNumber) async {
isloading=true;
refreshScreen();
    try{
      final path = "$baseUrl/login/otp/send";
      final response = await ApiService.getInstance().getClient().post(
        path,
        data: {
          "phoneNumber": "$dialcode$phoneNumber",
        },
      );

      final data = await response.data['data'];


      if (response.statusCode == 200) {
        print(data["sessionId"]);
        _loadOtpScreen();
        isloading=false;

      } else {
        isloading=false;

      }
    } on DioError catch(e){
      isloading=false;
      print('response code is ${e.response.statusCode}');

    }
    refreshScreen();

  }

  _loadOtpScreen(){
    Navigator.pushNamed(context, '/otpscreen');
  }




}