
import 'package:flutter/material.dart';
import 'package:future_trade/res/text_widget.dart';
import 'package:future_trade/utils/routes/routes_name.dart';
import 'package:future_trade/view/auth/login_screen.dart';
import 'package:future_trade/view/auth/otp_screen.dart';
import 'package:future_trade/view/auth/register_screen.dart';
import 'package:future_trade/view/auth/splash_screen.dart';
import 'package:future_trade/view/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:future_trade/view/products/product_view.dart';
import 'package:future_trade/view/profile/about_us_screen.dart';
import 'package:future_trade/view/profile/bank_details_screen.dart';
import 'package:future_trade/view/profile/policy_screen.dart';
import 'package:future_trade/view/profile/team.dart';
import 'package:future_trade/view/profile/terms_screen.dart';
import 'package:future_trade/view/wallet/deposit_screen.dart';
import 'package:future_trade/view/wallet/transaction_screen.dart';
import 'package:future_trade/view/wallet/wallet_screen.dart';
import 'package:future_trade/view/wallet/withdrawal_screen.dart';

class Routers {
  static WidgetBuilder generateRoute(String routeName) {
    switch (routeName) {
      case RoutesName.splashScreen:
        return (context) => const SplashScreen();
      case RoutesName.loginScreen:
        return (context) => const LoginScreen();
      case RoutesName.otpScreen:
        return (context) => const OtpScreen();
      // case RoutesName.registerScreen:
      //   return (context) => const RegisterScreen();
      case RoutesName.bottomNavBar:
        return (context) => const BottomNavBar();
      case RoutesName.walletScreen:
        return (context) => const WalletScreen();
      case RoutesName.depositScreen:
        return (context) =>  const DepositScreen();
      case RoutesName.withdrawPage:
        return (context) =>  const WithdrawPage();
      case RoutesName.transactionScreen:
        return (context) =>  const TransactionScreen();
      case RoutesName.bankDetailsScreen:
        return (context) =>  const BankDetailsScreen();
      case RoutesName.aboutUsScreen:
        return (context) =>  const AboutUsScreen();
      case RoutesName.myTeam:
        return (context) =>  const MyTeam();
      case RoutesName.termsScreen:
        return (context) =>  const TermsScreen();
      case RoutesName.policyScreen:
        return (context) =>  const PolicyScreen();
      case RoutesName.productViewScreen:
        return (context) =>  const ProductViewScreen();
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