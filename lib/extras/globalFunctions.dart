import 'package:flutter/material.dart';

openPageNoBack(context, screenName) {
  Navigator.pushAndRemoveUntil<dynamic>(
    context,
    MaterialPageRoute<dynamic>(
      builder: (BuildContext context) => screenName,
    ),
        (route) => false, //if you want to disable back feature set to false
  );
}

openPage(context, screenName) {
  Navigator.pushAndRemoveUntil<dynamic>(
    context,
    MaterialPageRoute<dynamic>(
      builder: (BuildContext context) => screenName,
    ),
        (route) => true, //if you want to disable back feature set to false
  );
}

