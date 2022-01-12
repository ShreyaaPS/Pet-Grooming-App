import 'package:flutter/material.dart';

const kTextColor = Color(0xFF535353);
const kTextLightColor = Color(0xFFACACAC);

const kDefaultPaddin = 25.0;

const kFeedbackFormFieldTextStyle = TextStyle(
  fontSize: 18.0,
  color: Colors.black87,
);

const kFeedbackFormFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.blue,
      width: 1.0,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.blue,
      width: 2.0,
    ),
  ),
);
