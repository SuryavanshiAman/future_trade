
import 'package:flutter/material.dart';
import 'package:future_trade/main.dart';
import 'package:future_trade/res/color-const.dart';
import 'package:future_trade/utils/routes/routes_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // SplashServices splashServices = SplashServices();
  // UpdateLanguageViewModel updateLanguageViewModel =UpdateLanguageViewModel();
  @override
  void initState() {
    super.initState();
    // splashServices.checkAuthentication(context);
    // updateLanguageViewModel.loadSwitchState();
    // updateLanguageViewModel.setHindi(!updateLanguageViewModel.isHindi);
    // // updateLanguageViewModel.updateLanguage(updateLanguageViewModel.isHindi);
    // getLanguage();
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushReplacementNamed(context, RoutesName.loginScreen);
    });
  }
  // getLanguage()async{
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final isSelectedLanguage=  prefs.getBool('isHindi');
  //   // print("langua hai:${updateLanguageViewModel.isDefaultSelectedLanguage}");
  //   print("ghfh :$isSelectedLanguage");
  //   if(isSelectedLanguage != null){
  //     if(isSelectedLanguage==true){
  //       updateLanguageViewModel.updateLanguage(Locale('hi', 'IN'));
  //       // updateLanguageViewModel.setButtonState(true);
  //     }else{
  //       // updateLanguageViewModel.setButtonState(false);
  //       updateLanguageViewModel.updateLanguage(Locale('en', 'US'));
  //     }
  //   }else{
  //     updateLanguageViewModel.updateLanguage(Locale('en', 'US'));
  //   }
  //
  // }

  final bool _visible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration:  const BoxDecoration(
          color: GameColor.primaryColor,
        ),
        child: AnimatedOpacity(
          opacity: _visible ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 500),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SizedBox(
              //   height: height * 0.2,
              // ),
              Image(
                image: const AssetImage("assets/images/future_trade_logo.png"),
                height: height * 0.35,
              ),
              // Padding(
              //   padding:
              //       EdgeInsets.only(left: 8.0, right: 8, top: height * 0.05),
              //   child: Text(
              //     "Withdraw Fast. Safe and Stable Quick Withdrawal",
              //     textAlign: TextAlign.center,
              //     style: TextStyle(
              //         fontSize: 24,
              //         fontWeight: FontWeight.w700,
              //         color: GameColor.white),
              //   ),
              // ),
              // Padding(
              //   padding:
              //       EdgeInsets.only(left: 8.0, right: 8, top: height * 0.05),
              //   child: Text(
              //     "COOE",
              //     textAlign: TextAlign.center,
              //     style: TextStyle(
              //         fontSize: 72,
              //         fontWeight: FontWeight.w900,
              //         color: GameColor.white),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
