
import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:future_trade/main.dart';
import 'package:future_trade/res/bubble_animation/Particles.dart';
import 'package:future_trade/res/bubble_animation/particle_engine.dart';
import 'package:future_trade/res/color-const.dart';
import 'package:future_trade/res/custom_container.dart';
import 'package:future_trade/res/custom_text_field.dart';
import 'package:future_trade/utils/routes/routes_name.dart';
import 'package:future_trade/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GameColor.white,
      body: SingleChildScrollView(

        child: Stack(
          children: [
            Container(

              decoration: const BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(image: AssetImage(
                      "assets/images/coming.png"
                  ),fit: BoxFit.cover)
              ),
              child: Particles(
                awayRadius: 100,
                particles: createParticles(),
                height: height,
                width:width,
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
                  height: height * 0.26,
                ),
                 Column(
                   children: [
                     SizedBox(
                       height: height * 0.1,
                     ),
                     Center(
                       child: Container(
                         width: width*0.9,
                         height: height*0.4,
                         padding: const EdgeInsets.all(35),
                         decoration: const BoxDecoration(
                           color: GameColor.bg,
                           shape: BoxShape.circle,
                           boxShadow: [
                           BoxShadow(
                             color: GameColor.white, //New
                             blurRadius:10 ,
                         ),
                       ],
                         ),
                         child: Column(
                           children: [
                              Center(
                              child: Text(
                                "Sign in",
                                style:  TextStyle(
                                    color: GameColor.black
                                    , fontWeight: FontWeight.w700, fontSize: 24),
                              ),
                                           ),
                             SizedBox(
                               height: height * 0.04,
                             ),
                             CustomTextField(
                               controller: _controller,
                               keyboardType: TextInputType.number,
                               label: "Enter your phone number",
                               hintColor: GameColor.black,
                               hintSize: 14,

                               // height: 70,
                               width: width * 0.65,
                               maxLength: 10,
                               filled: false,
                               border: Border.all(color:GameColor.black),
                               borderRadius: BorderRadius.circular(25),
                               fieldRadius:  BorderRadius.circular(25),
                               prefix:   Padding(
                                 padding: const EdgeInsets.all(15.0),
                                 child: Text(
                                   "+91",
                                   style: TextStyle(color: GameColor.black, fontSize: 16),
                                 ),
                               ),
                             ),
                             SizedBox(
                               height: height * 0.02,
                             ),
                             RichText(
                               textAlign: TextAlign.center,
                               text: TextSpan(
                                 style: const TextStyle(fontSize: 14, color: Colors.black),
                                 children: [
                                    TextSpan(
                                       text: "Don't have an ID?",
                                       style:  TextStyle(color: GameColor.black)),
                                   TextSpan(
                                     text: ' Register',
                                     style:   TextStyle(
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
                             ),

                             SizedBox(
                               height: height * 0.03,
                             ),
                             CustomContainer(
                               onTap: () {
                                 if (_controller.text.isEmpty || _controller.text.length <10) {
                                   Utils.show("Please enter phone no", context);
                                 } else {
                                   Navigator.pushNamed(context, RoutesName.otpScreen);
                                 }
                               },
                               alignment: Alignment.center,
                               height: height * 0.06,
                               widths: width * 0.5,
                               color: GameColor.purple,
                               borderRadius: const BorderRadius.all(Radius.circular(35)),
                               child: const Text(
                                 "Accept & Continue",
                                 style:  TextStyle(
                                     color: GameColor.white, fontWeight: FontWeight.w500),
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
