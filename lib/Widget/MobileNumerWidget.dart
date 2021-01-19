

import 'package:flutter/material.dart';
import 'package:flutter_app_zomato_signin/support/code_country.dart';
import 'package:flutter_app_zomato_signin/support/country_list_pick.dart';

class MobileNumberWidget extends StatefulWidget {
  BoxConstraints constraints;
  MobileNumberWidget({@required this.constraints});



  @override
  _MobileNumberWidgetState createState() => _MobileNumberWidgetState();
}

class _MobileNumberWidgetState extends State<MobileNumberWidget> {

  @override
  Widget build(BuildContext context) {
    BoxConstraints constraints=widget.constraints;
    return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(color: Colors.white,
                border: Border.all(
                  color: Colors.red[500],
                ),
                borderRadius: BorderRadius.circular(10)

            ),
            child: Row(
              children: [
                Container(
                  height: 30,
                  width: constraints.maxWidth * 0.19,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                          Radius.circular(10))),
                  padding: EdgeInsets.only(top: 5,bottom: 5,left: 5),
                  child: CountryListPick(
                    appBar: AppBar(
                      backgroundColor: Colors.amber,
                      title: Text('Country code'),
                    ),
                    theme: CountryTheme(
                      isShowFlag: true,
                      isShowTitle: false,
                      isShowCode: true,
                      isDownIcon: false,
                      showEnglishName: true,
                    ),
                    initialSelection: '+91',
                    onChanged: (CountryCode code) {
                      print(code.name);
                      print(code.code);
                      print(code.dialCode);
                      print(code.flagUri);
                    },
                  ),
                ),
                Container(
                    height: 50,
                    width: constraints.maxWidth * 0.55,
                    padding: EdgeInsets.symmetric( vertical: 10),
                    child: TextField(
                      style: TextStyle(fontSize: 17),
                      autocorrect: true,
                      onChanged: (numberstr) {},
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                            left: 7, bottom: 4, right: 7),
                        hintText: ' Phone Number ',
                        hintStyle:
                        TextStyle(color: Colors.grey),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(12.0)),
                          borderSide: BorderSide(
                              color: Colors.white, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(10.0)),
                          borderSide: BorderSide(
                              color: Colors.grey[50]),
                        ),
                      ),
                    )),
              ],
            ),
          ),

        ]);
  }
}
