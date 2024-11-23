import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:future_trade/generated/assets.dart';
import 'package:future_trade/main.dart';
import 'package:future_trade/res/bubble_animation/Particles.dart';
import 'package:future_trade/res/bubble_animation/particle_engine.dart';
import 'package:future_trade/res/circular_button.dart';
import 'package:future_trade/res/color-const.dart';
import 'package:future_trade/res/custom_container.dart';
import 'package:future_trade/res/custom_text_field.dart';
import 'package:future_trade/utils/routes/routes_name.dart';
import 'package:future_trade/utils/utils.dart';
import 'package:future_trade/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController passCont = TextEditingController();
  @override
  void initState() {
    super.initState();
  }
bool loginPassword=false;
  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
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
                awayRadius: 80,
                particles: createParticles(),
                height: height,
                width: width,
                onTapAnimation: true,
                awayAnimationDuration: const Duration(seconds: 3),
                awayAnimationCurve: Curves.linear,
                enableHover: true,
                hoverRadius: 90,
                connectDots: false,
              ),
            ),
            Center(
              child: Container(
                width: width >= 450 ?width * 0.5: width * 0.96,
                // height: height * 0.45,
                margin: EdgeInsets.only(top: height * 0.34),
                padding: const EdgeInsets.all(30),
                // padding: EdgeInsets.only(
                //     // 40
                //     // left: width >= 450 ? width * 0.1 : width * 0.1,
                //     // right: width >= 450 ? width * 0.1 : width * 0.1,
                //     top:loginPassword==true? height * 0.04:height*0.06,bottom: height*0.04
                // ),
                decoration:  BoxDecoration(
                  color: GameColor.bg,
                  shape: width >= 450 ? BoxShape.rectangle : BoxShape.circle,
                  borderRadius: width >= 450 ? BorderRadius.circular(50) : null,
                  boxShadow: [
                    BoxShadow(
                      color: GameColor.white, //New
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        "Sign in",
                        style: TextStyle(
                            color: GameColor.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 24),
                      ),
                    ),
                    SizedBox(
                      height: width >= 450 ? height * 0.025 : height * 0.01,
                    ),
                    Text(
                      "Enter your Registered no. to access account.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: GameColor.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                    ),
                    SizedBox(
                      height: width >= 450 ? height * 0.025 : height * 0.015,
                    ),
                    CustomTextField(
                      controller: _controller,
                      keyboardType: TextInputType.number,
                      label: "Enter your phone number",
                      hintColor: GameColor.black,
                      hintSize: 14,
                      // width: width >= 450 ? width * 0.25 : width * 0.65,
                      height: 50,
                      maxLength: 10,
                      filled: false,
                      border: Border.all(color: GameColor.black),
                      borderRadius: BorderRadius.circular(25),
                      fieldRadius: BorderRadius.circular(25),
                      prefix: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          "+91",
                          style:
                              TextStyle(color: GameColor.black, fontSize: 16),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: width >= 450 ? height * 0.025 : height * 0.015,
                    ),
                  loginPassword==true?  CustomTextField(
                      controller: passCont,
                      label: "Enter your password",
                      hintColor: GameColor.black,
                      keyboardType: TextInputType.name,
                      hintSize: 14,
                      // width: width >= 450 ? width * 0.25 : width * 0.65,
                      height: 50,
                      // maxLength: 10,
                      filled: false,
                      border: Border.all(color: GameColor.black),
                      borderRadius: BorderRadius.circular(25),
                      fieldRadius: BorderRadius.circular(25),
                      prefix: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Icon(Icons.password,color: GameColor.black,)
                        // Text(
                        //   "+91",
                        //   style:
                        //       TextStyle(color: GameColor.black, fontSize: 16),
                        // ),
                      ),
                    ):Container(),
                    SizedBox(
                      height: height * 0.01,
                    ),
                  loginPassword==false?
                  RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: const TextStyle(
                            fontSize: 14, color: Colors.black),
                        children: [
                          TextSpan(
                              text: "Don't have an ID? ",
                              style: TextStyle(color: GameColor.black)),
                          TextSpan(
                            text: 'Register',
                            style: TextStyle(
                              color: GameColor.black,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()..onTap = () {
                              Navigator.pushNamed(context, RoutesName.registerScreen);
                            },
                          ),
                        ],
                      ),
                    ):
                  Container(),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    loginPassword==false?
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: const TextStyle(
                            fontSize: 14, color: Colors.black),
                        children: [
                          TextSpan(
                              text: "Login via ",
                              style: TextStyle(color: GameColor.black)),
                          TextSpan(
                            text: 'Password',
                            style: TextStyle(
                              color: GameColor.black,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()..onTap = () {
                              setState(() {
                                loginPassword=true;
                              });

                            },
                          ),
                        ],
                      ),
                    ):
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: const TextStyle(
                            fontSize: 14, color: Colors.black),
                        children: [
                          TextSpan(
                              text: "Login via ",
                              style: TextStyle(color: GameColor.black)),
                          TextSpan(
                            text: 'OTP',
                            style: TextStyle(
                              color: GameColor.black,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()..onTap = () {
                              setState(() {
                                loginPassword=false;
                              });

                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    if (authViewModel.loading==false)
                      CustomContainer(
                        onTap: () {
                          setState(() {
                            if(loginPassword==false){
                              if (_controller.text.isEmpty ||
                                  _controller.text.length < 10) {
                                Utils.flushBarErrorMessage(
                                    "Please enter valid phone no.", context);
                              } else {
                                authViewModel.sedOtpApi(_controller.text, context);
                              }
                            } else{
                              if (_controller.text.isEmpty ||
                                  _controller.text.length < 10) {
                                Utils.flushBarErrorMessage(
                                    "Please enter valid phone no.", context);
                              } else if(passCont.text.isEmpty ) {
                                Utils.flushBarErrorMessage(
                                    "Please enter valid password", context);

                              }else{
                                Map data={
                                  "phone":_controller.text,
                                  "password":passCont.text
                                };
                                authViewModel.passwordApi(data, context);
                              }
                            }

                          });
                          },
                        alignment: Alignment.center,
                        height: height * 0.06,
                        widths:
                        // width >= 450 ? width * 0.2 :
                        width * 0.5,
                        color: GameColor.blue,
                        borderRadius: const BorderRadius.all(Radius.circular(35)),
                        child: const Text(
                          "Accept & Continue",
                          style: TextStyle(
                              color: GameColor.white,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    else const CircularButton(),
                  ],
                ),
              ),
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
