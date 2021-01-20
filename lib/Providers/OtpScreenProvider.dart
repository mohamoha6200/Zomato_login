import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

class OtpScreenProvider extends ChangeNotifier {
  int $totalDuration = 30;
  String totalDurationinstr='';
   bool iscountdownOn=true;
   bool istimerDone=false;
  countDown() {

  if(iscountdownOn) {
    iscountdownOn=false;
    int endTime = DateTime
        .now()
        .millisecondsSinceEpoch + 1000 * 30;

    Timer.periodic(Duration(seconds: 1), (timer) {
      $totalDuration -= 1;
      if ($totalDuration < 10) {
        totalDurationinstr = '0${$totalDuration}';
      }
      else {
        totalDurationinstr = '${$totalDuration}'; /**/
      }

      if ($totalDuration <= 0) {
        istimerDone=true;
        timer.cancel();
      }
      notifyListeners();
    });
  }


  }


}
