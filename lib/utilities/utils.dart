import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'constants/colors.dart';



showToast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.blue.shade900,
      textColor: Colors.white,
      fontSize: 16.0);
}
showWarningToast(String message){ 
   Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
       backgroundColor: VendiColors.tertiaryColor,
      textColor: Colors.white,
      fontSize: 16.0);
}
showErrorToast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
       backgroundColor: Colors.red[200],
      textColor: Colors.white,
      fontSize: 16.0);
}

String capitalize(val) {
  return "${val[0].toUpperCase()}${val.substring(1)}";
}
