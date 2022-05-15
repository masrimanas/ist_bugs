import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// auth
const googleCientId =
    '21859136501-j78l17rl2kaimd6e3jrfmaefiflualra.apps.googleusercontent.com';

// colors
const Color kGovernorBay = Color(0xff4338CA);
const Color kNewMidnightBlue = Color(0xff000e98);
const Color kRichBlack = Color(0xFF000814);

// text style

final TextStyle kHeading5 =
    GoogleFonts.raleway(fontSize: 23, fontWeight: FontWeight.bold);
final TextStyle kHeading6 = GoogleFonts.raleway(
    fontSize: 19, fontWeight: FontWeight.w400, letterSpacing: 0.15);
final TextStyle kSubtitle = GoogleFonts.raleway(
    fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.15);
final TextStyle kBodyText = GoogleFonts.raleway(
    fontSize: 13, fontWeight: FontWeight.w400, letterSpacing: 0.25);

// text theme
final kTextTheme = TextTheme(
  headline5: kHeading5,
  headline6: kHeading6,
  subtitle1: kSubtitle,
  bodyText2: kBodyText,
);

// color scheme
const kColorScheme = ColorScheme(
  primary: Color(0xff6200ee),
  primaryContainer: Color(0xff3700b3),
  secondary: kGovernorBay,
  secondaryContainer: kNewMidnightBlue,
  surface: Colors.white,
  background: Colors.white,
  error: Colors.red,
  onPrimary: Colors.white,
  onSecondary: kRichBlack,
  onSurface: kRichBlack,
  onBackground: kRichBlack,
  onError: Colors.white,
  brightness: Brightness.light,
);
