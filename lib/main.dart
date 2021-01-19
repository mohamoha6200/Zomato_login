import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_zomato_signin/Widget/MobileNumerWidget.dart';
import 'package:flutter_app_zomato_signin/support/ConstantsVariables.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import 'support/code_country.dart';
import 'support/country_list_pick.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: ZomatoLoginStateful(title: 'Flutter Demo Home Page'),
    );
  }
}

class ZomatoLoginStateful extends StatefulWidget {
  ZomatoLoginStateful({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _ZomatoLoginStatefulState createState() => _ZomatoLoginStatefulState();
}

class _ZomatoLoginStatefulState extends State<ZomatoLoginStateful> {
  ScrollController controller;

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(

      body: SingleChildScrollView(
        controller: controller,
        physics: ClampingScrollPhysics(

        ),
        child: Container(
          height: size.height,
          child: Stack(
            children: [
              Container(
                height: size.height,
                width: size.width,
                child: Image.asset(
                  'assets/images/bg.png',
                  fit: BoxFit.fill,
                ),
              ),
              Column(
                children: [
                  Container(
                    height: size.height / 2,
                    width: size.width,
                    child: GestureDetector(
                      onTap:  () {
                        controller.animateTo(controller.position.maxScrollExtent);
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 30, right: 20),
                        child: Align(
                            alignment: Alignment.topRight,
                            child: MaterialButton(
                              onPressed: () {},
                              color: Colors.black45,
                              minWidth: 70,
                              shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(30.0)),
                              padding: EdgeInsets.zero,
                              child: Text(
                                'Skip',
                                style: TextStyle(color: Colors.white70),
                              ),
                            )),
                      ),
                    ),
                  ),
                  Container(
                    height: size.height / 2,
                    width: size.width,
                    child: LayoutBuilder(builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 50,
                            ),
                            MobileNumberWidget(constraints: constraints),
                            Container(
                                width: constraints.maxWidth * 0.85,
                                height: 50,
                                margin: EdgeInsets.only(top: 20),
                                child: Align(
                                    child: Text(
                                      "Send OTP",
                                      style:
                                      TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    )),
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(7)))),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              width: constraints.maxWidth,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  Container(
                                    width: (constraints.maxWidth/2) -40 ,
                                    height: 1,
                                    color: Colors.white38,
                                  ),
                                  Text(
                                    " OR ",
                                    style: TextStyle(color: Colors.white70),
                                  ),
                                  Container(
                                  width:  (constraints.maxWidth/2)-40 ,
                                    height: 1,
                                    color: Colors.white38,
                                  ),
                                ],
                              ),
                            ),
                            // email button
                            Container(
                              decoration: BoxDecoration(color: Colors.white,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(7)),

                              ),
                              width: constraints.maxWidth * 0.85,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Align(child: Icon(Icons.mail, size: 30,),
                                      alignment: Alignment.topLeft,
                                    ),
                                    Expanded(child: Text("Continue with Email",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 20,
                                          fontWeight: FontWeight.w800),))
                                  ],
                                ),
                              ),
                            ),
// other social media
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              width: constraints.maxWidth * 0.85,
                              child:
                              Row(children: [
                                Container(
                                  width:(constraints.maxWidth * 0.85)/2 -5,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(7)),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .start,
                                      children: [
                                        Align(child: SvgPicture.asset(
                                          'assets/images/facebook.svg',
                                          height: 25,),
                                          alignment: Alignment.topLeft,
                                        ),
                                        Expanded(child: Text("Facebook",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 17,
                                              fontWeight: FontWeight.w800),))
                                      ],
                                    ),
                                  ),
                                ),
                              SizedBox(width: 10,),
                                Container(
                                  width:(constraints.maxWidth * 0.85)/2 -5,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(7)),

                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .start,
                                      children: [
                                        Align(child: SvgPicture.asset(
                                          'assets/images/search.svg',
                                          height: 25,),
                                          alignment: Alignment.topLeft,
                                        ),
                                        Expanded(child: Text("Google",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 17,
                                              fontWeight: FontWeight.w800),))
                                      ],
                                    ),
                                  ),
                                )
                              ],)
                              ,),
                            Container(
                              margin: EdgeInsets.only(top: 20, bottom: 20),
                              width: constraints.maxWidth * 0.85,
                              child: Expanded(
                                child: Text("By continuing you agree to our\n"
                                    "Terms of services Privacy Policy Content Policy",
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )

                          ]);
                    }),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
