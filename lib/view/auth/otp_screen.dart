
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:future_trade/main.dart';
import 'package:future_trade/res/color-const.dart';
import 'package:future_trade/res/constantButton.dart';
import 'package:future_trade/res/pinput/pinput.dart';
import 'package:future_trade/utils/routes/routes_name.dart';
import 'package:future_trade/utils/utils.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController otpCon = TextEditingController();
  @override
  void initState() {
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GameColor.white,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage(
                "assets/images/login.gif"
            ),fit: BoxFit.cover)
        ),
        child: SingleChildScrollView(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.35,
              ),

              Container(
                width: width*0.95,
                height: height*0.45,
                padding: const EdgeInsets.all(35),
                decoration: BoxDecoration(
                  color: GameColor.black,
                  shape: BoxShape.circle,
                  boxShadow: const [
                    BoxShadow(
                      color: GameColor.secondaryColor, //New
                      blurRadius: 10,
                    ),

                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.01,
                    ),
                    const Center(
                      child: Text(
                        "Verification",
                        style:  TextStyle(
                            color: Color(0xfff9d4fa)
                            , fontWeight: FontWeight.w700, fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                     const Text(
                      "Enter the code sent to the number",
                      textAlign: TextAlign.center,
                      style:  TextStyle(
                          color:GameColor.white
                          , fontWeight: FontWeight.w700, fontSize: 16),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "+91 7458946942",
                          style:  TextStyle(
                              color: GameColor.white
                              , fontWeight: FontWeight.w700, fontSize: 16),
                        ),
                        SizedBox(width: width*0.03,),
                        Icon(Icons.edit,color: GameColor.lightPink,)
                      ],
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18, right: 18),
                      child:Pinput(
                        controller: otpCon,
                        length: 6,
                        defaultPinTheme: PinTheme(
                          width: width*0.11,
                          height: height*0.05,
                          textStyle:  const TextStyle(fontSize: 20, color: GameColor.white),
                          decoration:  BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: GameColor.lightPink, width: 2,
                            ),
                          ),
                        ),
                        focusedPinTheme:  PinTheme(
                          width: width*0.11,
                          height: height*0.05,
                          textStyle: const TextStyle(fontSize: 20, color: GameColor.white),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: GameColor.purple, width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    ConstantButton(
                      onTap: () {
                      if (otpCon.text.isEmpty || otpCon.text.length <6) {
                        Utils.show("Please enter Otp",color: GameColor.gameRed, context);
                      } else {
                        Navigator.pushReplacementNamed(context, RoutesName.homeScreen);
                      }
                    }, text: 'Submit',
                      btnColor: GameColor.purple,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: const TextStyle(fontSize: 14, color: Colors.black),
                        children: [
                          const TextSpan(
                              text: "Don't Received Otp?",
                              style:  TextStyle(color: GameColor.white)),
                          TextSpan(
                            text: ' Resend',
                            style:  const TextStyle(
                              color: GameColor.primaryColor,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()..onTap = () {},
                          ),

                        ],
                      ),
                    ),

                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
