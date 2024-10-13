import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

pp(dynamic msg) {
  var time = DateTime.now().toIso8601String();
  if (kReleaseMode) {
    return;
  }
  if (kDebugMode) {
    if (msg is String) {
      debugPrint('$time ==> $msg');
    } else {
      print('$time ==> $msg');
    }
  }
}

String getStringColor(Color color) {
  var stringColor = 'black';
  switch (color) {
    case Colors.white:
      stringColor = 'white';
      break;
    case Colors.red:
      stringColor = 'red';
      break;
    case Colors.black:
      stringColor = 'black';
      break;
    case Colors.amber:
      stringColor = 'amber';
      break;
    case Colors.yellow:
      stringColor = 'yellow';
      break;
    case Colors.pink:
      stringColor = 'pink';
      break;
    case Colors.purple:
      stringColor = 'purple';
      break;
    case Colors.green:
      stringColor = 'green';
      break;
    case Colors.teal:
      stringColor = 'teal';
      break;
    case Colors.indigo:
      stringColor = 'indigo';
      break;
    case Colors.blue:
      stringColor = 'blue';
      break;
    case Colors.orange:
      stringColor = 'orange';
      break;

    default:
      stringColor = 'black';
      break;
  }
  return stringColor;
}

Color getColor(String stringColor) {
  switch (stringColor) {
    case 'white':
      return Colors.white;
    case 'red':
      return Colors.red;
    case 'black':
      return Colors.black;
    case 'amber':
      return Colors.amber;
    case 'yellow':
      return Colors.yellow;
    case 'pink':
      return Colors.pink;
    case 'purple':
      return Colors.purple;
    case 'green':
      return Colors.green;
    case 'teal':
      return Colors.teal;
    case 'indigo':
      return Colors.indigo;
    case 'blue':
      return Colors.blue;
    case 'orange':
      return Colors.orange;
    default:
      return Colors.black;
  }
}

String getDeviceType() {
  final data = MediaQueryData.fromView(WidgetsBinding.instance.window);
  return data.size.shortestSide < 600 ? 'phone' : 'tablet';
}

String getThisDeviceType() {
  final data = MediaQueryData.fromView(WidgetsBinding.instance.window);
  return data.size.shortestSide < 600 ? 'phone' : 'tablet';
}

TextStyle myTextStyle({Color? color, double? fontSize, FontWeight? weight}) {
  if (color != null) {
    return GoogleFonts.roboto(
      fontWeight: weight ?? FontWeight.normal,
      fontSize: fontSize ?? 14,
      color: color,
    );
  }

  return GoogleFonts.roboto(
    fontWeight: weight ?? FontWeight.normal,
    fontSize: fontSize ?? 14,
    color: color,
  );
}
TextStyle myNumberThickStyle({Color? color, double? fontSize, FontWeight? weight}) {
  if (color != null) {
    return GoogleFonts.protestStrike(
      fontWeight: weight ?? FontWeight.normal,
      fontSize: fontSize ?? 14,
      color: color,
    );
  }

  return GoogleFonts.protestStrike(
    fontWeight: weight ?? FontWeight.normal,
    fontSize: fontSize ?? 14,
    color: color,
  );
}
TextStyle myNumberNormalStyle({Color? color, double? fontSize, FontWeight? weight}) {
  if (color != null) {
    return GoogleFonts.notoSans(
      fontWeight: weight ?? FontWeight.normal,
      fontSize: fontSize ?? 14,
      color: color,
    );
  }

  return GoogleFonts.notoSans(
    fontWeight: weight ?? FontWeight.normal,
    fontSize: fontSize ?? 14,
    color: color,
  );
}

const gapW4 = SizedBox(width: 4.0);
const gapW8 = SizedBox(width: 8.0);
const gapW12 = SizedBox(width: 12.0);
const gapW16 = SizedBox(width: 16.0);
const gapW32 = SizedBox(width: 32.0);
const gapW64 = SizedBox(width: 64.0);
const gapW100 = SizedBox(width: 100.0);

const gapH4 = SizedBox(height: 4.0);
const gapH8 = SizedBox(height: 8.0);
const gapH12 = SizedBox(height: 12.0);
const gapH16 = SizedBox(height: 16.0);
const gapH32 = SizedBox(height: 32.0);
const gapH64 = SizedBox(height: 64.0);
const gapH100 = SizedBox(height: 100.0);

showToast(
    {required String message,
    required BuildContext context,
    Color? backgroundColor,
    TextStyle? textStyle,
    Duration? duration,
    double? padding,
    ToastGravity? toastGravity}) {
  FToast fToast = FToast();
  const mm = 'FunctionsAndShit: 💀 💀 💀 💀 💀 : ';
  try {
    fToast.init(context);
  } catch (e) {
    pp('$mm FToast may already be initialized');
  }
  Widget toastContainer = Container(
    width: 320,
    padding: EdgeInsets.symmetric(
        horizontal: padding ?? 20.0, vertical: padding ?? 20.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8.0),
      color: backgroundColor ?? Colors.black,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: textStyle ?? myTextStyle(color: Colors.white),
          ),
        ),
      ],
    ),
  );

  try {
    fToast.showToast(
      child: toastContainer,
      gravity: toastGravity ?? ToastGravity.CENTER,
      toastDuration: duration ?? const Duration(seconds: 3),
    );
  } catch (e) {
    pp('$mm 👿👿👿👿👿 we have a small TOAST problem, Boss! - 👿 $e');
  }
}

showErrorToast(
    {required String message,
    required BuildContext context,
    TextStyle? textStyle,
    double? padding,
    Duration? duration,
    ToastGravity? toastGravity}) {
  FToast fToast = FToast();
  const mm = 'FunctionsAndShit: 💀 💀 💀 💀 💀 : ';
  try {
    fToast.init(context);
  } catch (e) {
    pp('$mm FToast may already be initialized');
  }
  Widget toastContainer = Container(
    width: 400,
    padding: EdgeInsets.symmetric(
        horizontal: padding ?? 20.0, vertical: padding ?? 20.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8.0),
      color: Colors.pink,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    ),
  );

  try {
    fToast.showToast(
      child: toastContainer,
      gravity: toastGravity ?? ToastGravity.CENTER,
      toastDuration: duration ?? const Duration(seconds: 10),
    );
  } catch (e) {
    pp('$mm 👿👿👿👿👿 we have a small TOAST problem, Boss! - 👿 $e');
  }
}

showOKToast(
    {required String message,
    required BuildContext context,
    Color? backgroundColor,
    TextStyle? textStyle,
    Duration? duration,
    double? padding,
    ToastGravity? toastGravity}) {
  FToast fToast = FToast();
  const mm = 'FunctionsAndShit: 💀 💀 💀 💀 💀 : ';
  try {
    fToast.init(context);
  } catch (e) {
    pp('$mm FToast may already be initialized');
  }
  Widget toastContainer = Container(
    width: 400,
    padding: EdgeInsets.symmetric(
        horizontal: padding ?? 20.0, vertical: padding ?? 20.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8.0),
      color: backgroundColor ?? Colors.green.shade900,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: textStyle ?? const TextStyle(color: Colors.white),
          ),
        ),
      ],
    ),
  );

  try {
    fToast.showToast(
      child: toastContainer,
      gravity: toastGravity ?? ToastGravity.CENTER,
      toastDuration: duration ?? const Duration(seconds: 10),
    );
  } catch (e) {
    pp('$mm 👿👿👿👿👿 we have a small TOAST problem, Boss! - 👿 $e');
  }
}
