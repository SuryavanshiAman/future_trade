
import 'package:flutter/material.dart';
import 'package:future_trade/res/text_widget.dart';
import 'package:future_trade/utils/routes/routes_name.dart';
import 'package:future_trade/view/Home/home_screen.dart';
import 'package:future_trade/view/auth/login_screen.dart';
import 'package:future_trade/view/auth/otp_screen.dart';
import 'package:future_trade/view/auth/register_screen.dart';
import 'package:future_trade/view/auth/splash_screen.dart';

class Routers {
  static WidgetBuilder generateRoute(String routeName) {
    switch (routeName) {
      case RoutesName.splashScreen:
        return (context) => const SplashScreen();
      case RoutesName.loginScreen:
        return (context) => const LoginScreen();
      case RoutesName.otpScreen:
        return (context) => const OtpScreen();
      case RoutesName.registerScreen:
        return (context) => const RegisterScreen();
      // case RoutesName.forgotScreen:
      //   return (context) => const ForgotPassScreen();
      case RoutesName.homeScreen:
        return (context) =>  HomeScreen();
      default:
        return (context) => Scaffold(
              body: Center(
                child: textWidget(
                    text: 'No Route Found!',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            );
    }
  }
}