import 'package:flutter/material.dart';
import 'package:future_trade/generated/assets.dart';
import 'package:future_trade/res/color-const.dart';
import 'package:future_trade/res/text_widget.dart';
import 'package:future_trade/utils/routes/routes_name.dart';
import 'package:future_trade/view_model/services/splash_services.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashServices = SplashServices();
  // UpdateLanguageViewModel updateLanguageViewModel =UpdateLanguageViewModel();
  @override
  void initState() {
    super.initState();
    // splashServices.checkAuthentication(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final splashServices =
          Provider.of<SplashServices>(context, listen: false);
      splashServices.updateApkApi(context);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.bottomCenter,
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage(Assets.imagesSplash), fit: BoxFit.fill),
          color: GameColor.black,
        ),
        child: Consumer<SplashServices>(
                      builder: (context, splashViewModel, child) {
                    return splashViewModel.loading == 0.0
                        ? Container() // Hide progress bar when loading is complete
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                              textWidget(
                                text: 'Please wait while updating app...',
                                fontSize: 15,
                                color: Colors.white,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 10),
                                child: LinearProgressIndicator(
                                  backgroundColor: Colors.black54,
                                  valueColor:  AlwaysStoppedAnimation<Color>(
                                     GameColor.green
                                  ),
                                  value: splashViewModel.loading,
                                  minHeight: 10,
                                ),
                              ),
                              const SizedBox(height: 20),
                            ],
                          );
                  }),
      ),
    );
  }
}
