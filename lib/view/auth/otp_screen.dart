import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:future_trade/generated/assets.dart';
import 'package:future_trade/main.dart';
import 'package:future_trade/res/bubble_animation/Particles.dart';
import 'package:future_trade/res/bubble_animation/particle_engine.dart';
import 'package:future_trade/res/circular_button.dart';
import 'package:future_trade/res/color-const.dart';
import 'package:future_trade/res/constantButton.dart';
import 'package:future_trade/res/pinput/pinput.dart';
import 'package:future_trade/utils/utils.dart';
import 'package:future_trade/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

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
    final verify = Provider.of<AuthViewModel>(context);
    Map<String, dynamic> arguments =
    ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    String phone = arguments["phone"].toString();
    String otp = arguments["otp"].toString();
    return Scaffold(
      backgroundColor: GameColor.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                      image: AssetImage(Assets.imagesComing),
                      fit: BoxFit.cover)),
              child: Particles(
                awayRadius: 100,
                particles: createParticles(),
                height: height,
                width: width,
                onTapAnimation: true,
                awayAnimationDuration: const Duration(seconds: 300),
                awayAnimationCurve: Curves.linear,
                enableHover: true,
                hoverRadius: 90,
                connectDots: false,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: height * 0.35,
                ),
                Center(
                  child: Container(
                    width: width * 0.95,
                    height: height * 0.45,
                    padding: const EdgeInsets.all(35),
                    decoration: const BoxDecoration(
                      color: GameColor.bg,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: GameColor.white, //New
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Center(
                          child: Text(
                            "Verification",
                            style: TextStyle(
                                color: GameColor.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Text(
                          "Enter the Otp sent to the number",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: GameColor.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 16),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "+91 $phone",
                              style: TextStyle(
                                  color: GameColor.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16),
                            ),
                            SizedBox(
                              width: width * 0.03,
                            ),
                            GestureDetector(
                              onTap: (){Navigator.pop(context);},
                              child: Icon(
                                Icons.edit,
                                color: GameColor.black,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Padding(
                          padding:  EdgeInsets.only(left: width>=450?width*0.17:18, right:width>=450?width*0.17: 18),
                          child: Pinput(
                            controller: otpCon,
                            length: 6,
                            defaultPinTheme: PinTheme(
                              width: width * 0.11,
                              height: height * 0.05,
                              textStyle:
                                  TextStyle(fontSize: 20, color: GameColor.black),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: GameColor.blue,
                                  width: 2,
                                ),
                              ),
                            ),
                            focusedPinTheme: PinTheme(
                              width: width * 0.11,
                              height: height * 0.05,
                              textStyle:
                                  TextStyle(fontSize: 20, color: GameColor.black),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: GameColor.green,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        if (verify.loading==false)
                        ConstantButton(
                          width: width>=450?width*0.4:width*0.5,
                          onTap: () {
                            if (otpCon.text.isEmpty || otpCon.text.length < 6) {
                              Utils.flushBarErrorMessage(
                                  "Please enter Otp", context);
                            } else {
                              verify.verifyOtpApi(phone, otp, context);
                            }
                          },
                          text: 'Submit',
                          btnColor: GameColor.blue,
                          borderRadius: BorderRadius.circular(25),
                        )
        else const CircularButton(),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: const TextStyle(
                                fontSize: 14, color: Colors.black),
                            children: [
                              TextSpan(
                                  text: "Don't Received Otp?",
                                  style: TextStyle(color: GameColor.black)),
                              TextSpan(
                                text: ' Resend',
                                style: TextStyle(
                                  color: GameColor.black,
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()..onTap = () {
                                  verify.sedOtpApi(phone, context);
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<Particle> createParticles() {
    var rng = Random();
    List<Particle> particles = [];
    for (int i = 0; i < 140; i++) {
      particles.add(Particle(
        color: GameColor.bg,
        size: rng.nextDouble() * 10,
        velocity: Offset(rng.nextDouble() * 50 * randomSign(),
            rng.nextDouble() * 50 * randomSign()),
      ));
    }
    return particles;
  }

  double randomSign() {
    var rng = Random();
    return rng.nextBool() ? 1 : -1;
  }
}
