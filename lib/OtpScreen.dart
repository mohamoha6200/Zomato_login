import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:sms_autofill/sms_autofill.dart';

import 'Constants.dart';
import 'EditedPackages/OtpPackages/otp_field.dart';
import 'EditedPackages/OtpPackages/style.dart';
import 'Providers/LoginScreenProvider.dart';
import 'Providers/OtpScreenProvider.dart';
import 'support/ConstantsVariables.dart';


class OtpScreen  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OtpScreenStateful();
  }
}


class OtpScreenStateful extends StatefulWidget {
  @override
  _OtpScreenState createState() => _OtpScreenState();
}


class _OtpScreenState extends State<OtpScreenStateful> with CodeAutoFill  {
  String otpcode;
  @override
  void initState() {
    _getAuthSignature();
    listenForCode();
    _listenOtp();


    super.initState();
  }
  Future<void> _getAuthSignature() async {
    String str= await SmsAutoFill().getAppSignature;
    print("app sign is $str");
  }
  Future<void>  _listenOtp() async{
    await SmsAutoFill().listenForCode;
  }

  @override
  void codeUpdated() {

/*    setState(() {
      controller.setOtp("$code");
      print("otp is $otpcode");
      otpcode = code;
    });*/
  }

  OtpBlockController controller=new OtpBlockController();

  bool iscontinoueStatus = false;
  int _pinlength=6;
  @override
  Widget build(BuildContext context) {
    final provider=   Provider.of<OtpScreenProvider>(context);

    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset : true,
        appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text("Enter Verification Code",style: TextStyle(color: Colors.black),)),
        body: Consumer<OtpScreenProvider>(
            builder: (context, value, child) {
              final provider=  Provider.of<LoginProvider>(context);
              value.countDown();
              return LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    return Container(
                      height: constraints.maxHeight, width: constraints.maxWidth,
                      color: Colors.white,
                      child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 10,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(top: 20,
                                          bottom: 20,
                                          left: 30,
                                          right: 30)
                                      , child: Center(
                                         child: RichText(
                                        textAlign:TextAlign.center ,
                                        text: TextSpan(

                                          text: ' ',
                                          style: DefaultTextStyle.of(context).style,
                                          children: <TextSpan>[
                                            TextSpan(text: 'We have sent Verification Code to\n',),
                                            TextSpan(text: ' ${provider.phno}' , style: TextStyle(fontWeight: FontWeight.bold)),
                                          ],
                                        ),
                                      ),
                                    ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 50,vertical: 20),
                                      child: OTPTextField(
                                        length: _pinlength,
                                        controller: controller,
                                        width: MediaQuery
                                            .of(context)
                                            .size
                                            .width,
                                        textFieldAlignment: MainAxisAlignment
                                            .spaceEvenly,
                                        fieldWidth: 40,
                                        fieldheight: 40,
                                        fieldStyle: FieldStyle.box,
                                        style: TextStyle(
                                            fontSize: 20
                                        ),
                                        onCompleted: (pin) {
                                        /*  setState(() {
                                            iscontinoueStatus = true;
                                          });*/
                                        },
                                        uncomplete: () {
                                          /*if (iscontinoueStatus == true)
                                            setState(() {
                                              iscontinoueStatus = false;
                                            });*/
                                        },
                                      ),
                                    ),


                                  ]),
                            ),
                            Expanded(
                              flex: 7,
                              child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                 Text("0:${value.totalDurationinstr}",style: TextStyle(fontSize: 24),),
                                   SizedBox(height: 20,),
                                    RichText(
                                      text: TextSpan(
                                        style: DefaultTextStyle.of(context).style,
                                        children: <TextSpan>[
                                          TextSpan(text: "Didn't receive the code?", style: TextStyle(fontWeight: FontWeight.bold)),
                                          TextSpan(text: ' Resent Now',style: ((){
                                            if(value.istimerDone==true){
                                              return TextStyle(color: HexColor("${resent_red}"));
                                            }else{
                                              return TextStyle(color: HexColor("${resentdefault}"));
                                            }

                                          }())),
                                        ],
                                      ),
                                    )




                                  ]),
                            ),
                            Expanded(
                                flex: 1,
                                child: Container()
                            ),
                          ]),

                    );
                  }
              );
            } ),


      ),
    );


  }






}
