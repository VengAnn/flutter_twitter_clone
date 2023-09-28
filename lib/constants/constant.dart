import 'package:flutter/material.dart';

const kPrimaryColor = Color(0XFF6F35A5);
const kPrimaryLightColor = Color(0XFFF1E6FF);

//title text style
const kTitleTextStyle = TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

/// Subtitle text Style
const kSubTitleTextStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.bold,
  color: Colors.deepPurple,
);

/// Body text Style
const kBodyTextStyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.bold,
  color: Colors.black,
);

//Elevated Button style
var kElevateButtonStyle = ElevatedButton.styleFrom(
  primary: Colors.black,
  foregroundColor: Colors.white,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
  ),
  splashFactory: InkSplash.splashFactory,
);

//sizedbox20
const kSizedBox20 = SizedBox(
  height: 20,
);
const kSizedBox15 = SizedBox(
  height: 15,
);
