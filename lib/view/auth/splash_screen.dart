
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration:  const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/coming soon.gif"),fit: BoxFit.fill)
          // color: GameColor.primaryColor,
        ),
      ),
    );
  }
}
