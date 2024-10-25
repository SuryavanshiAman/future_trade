//
// import 'dart:math';
//
// import 'package:flutter/material.dart';
// import 'package:future_trade/main.dart';
// import 'package:future_trade/res/bubble_animation/Particles.dart';
// import 'package:future_trade/res/bubble_animation/particle_engine.dart';
// import 'package:future_trade/res/color-const.dart';
// import 'package:future_trade/res/custom_container.dart';
// import 'package:future_trade/res/custom_text_field.dart';
// import 'package:future_trade/utils/routes/routes_name.dart';
// import 'package:future_trade/utils/utils.dart';
//
// class RegisterScreen extends StatefulWidget {
//   const RegisterScreen({super.key});
//
//   @override
//   State<RegisterScreen> createState() => _RegisterScreenState();
// }
//
// class _RegisterScreenState extends State<RegisterScreen> {
//   TextEditingController mobileCont =TextEditingController();
//   TextEditingController nameCont =TextEditingController();
//   TextEditingController passCont =TextEditingController();
//   TextEditingController referralCont =TextEditingController();
//   @override
//   void initState() {
//     super.initState();
//
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: GameColor.white,
//       body: SingleChildScrollView(
//
//         child: Stack(
//           // crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SizedBox(
//               height: height * 0.26,
//             ),
//             Container(
//               decoration: const BoxDecoration(
//                   color: Colors.black,
//                   image: DecorationImage(image: AssetImage(
//                       "assets/images/coming.png"
//                   ),fit: BoxFit.cover)
//               ),
//               child: Particles(
//                 awayRadius: 100,
//                 particles: createParticles(),
//                 height: height,
//                 width:width,
//                 onTapAnimation: true,
//                 awayAnimationDuration: const Duration(seconds: 300),
//                 awayAnimationCurve: Curves.linear,
//                 enableHover: true,
//                 hoverRadius: 90,
//                 connectDots: false,
//               ),
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 SizedBox(
//                   height: height * 0.3,
//                 ),
//                 Center(
//                   child: Container(
//                     width: width*0.96,
//                     height: height*0.5,
//                     padding: const EdgeInsets.all(35),
//                     decoration: BoxDecoration(
//                       color: GameColor.bg,
//                       shape: BoxShape.circle,
//                       boxShadow: const [
//                         BoxShadow(
//                           color: GameColor.white, //New
//                           blurRadius: 10,
//                         ),
//
//                       ],
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                          Center(
//                           child: Text(
//                             "Sign up",
//                             style:  TextStyle(
//                                 color: GameColor.black
//                                 , fontWeight: FontWeight.w700, fontSize: 24),
//                           ),
//                         ),
//                         SizedBox(
//                           height: height * 0.01,
//                         ),
//                         CustomTextField(
//                           controller: nameCont,
//                           label: "Enter your name.",
//                           hintColor: GameColor.black,
//                           hintSize: 14,
//                           width: width * 0.65,
//                           height: height*0.06,
//                           filled: false,
//                           border: Border.all(color: GameColor.black),
//                           borderRadius: BorderRadius.circular(25),
//                           fieldRadius:  BorderRadius.circular(25),
//                           prefix:   Padding(
//                             padding: EdgeInsets.all(0.0),
//                             child: Icon(Icons.person,color:  GameColor.black,)
//                           ),
//                         ),
//                         CustomTextField(
//                           controller: mobileCont,
//                           keyboardType: TextInputType.number,
//                           label: "Enter your phone number.",
//                           hintColor: GameColor.black,
//                           hintSize: 14,
//                           height: height*0.06,
//                           width: width * 0.65,
//                           maxLength: 10,
//                           filled: false,
//                           border: Border.all(color: GameColor.black),
//                           borderRadius: BorderRadius.circular(25),
//                           fieldRadius:  BorderRadius.circular(25),
//                           prefix:   Padding(
//                             padding: EdgeInsets.all(15.0),
//                             child: Text(
//                               "+91",
//                               style: TextStyle(color: GameColor.black, fontSize: 16),
//                             ),
//                           ),
//                         ),
//                         CustomTextField(
//                           controller: referralCont,
//                           label: "Enter referral code.",
//                           hintColor: GameColor.black,
//                           hintSize: 14,
//                           height: height*0.06,
//                           width: width * 0.65,
//                           filled: false,
//                           border: Border.all(color: GameColor.black),
//                           borderRadius: BorderRadius.circular(25),
//                           fieldRadius:  BorderRadius.circular(25),
//                           prefix:   Padding(
//                             padding: EdgeInsets.all(15.0),
//                             child: Icon(Icons.card_giftcard,color:  GameColor.black,)
//                           ),
//                         ),
//                         CustomTextField(
//                           controller: passCont,
//                           label: "Enter password.",
//                           hintColor: GameColor.black,
//                           hintSize: 14,
//                           height: height*0.06,
//                           width: width * 0.65,
//                           maxLength: 8,
//                           filled: false,
//                           border: Border.all(color: GameColor.black),
//                           borderRadius: BorderRadius.circular(25),
//                           fieldRadius:  BorderRadius.circular(25),
//                           prefix:   Padding(
//                             padding: EdgeInsets.all(15.0),
//                             child: Icon(Icons.password,color:  GameColor.black,)
//                           ),
//                         ),
//                         SizedBox(
//                           height: height * 0.01,
//                         ),
//
//                         CustomContainer(
//                           onTap: () {
//                             if (nameCont.text.isEmpty) {
//                               Utils.show("Please enter your name",color: GameColor.gameRed, context);
//                             } else if (mobileCont.text.isEmpty || mobileCont.text.length <10) {
//                               Utils.show("Please enter phone no.",color: GameColor.gameRed, context);
//                             }else if (referralCont.text.isEmpty ) {
//                               Utils.show("Please enter referral code.",color: GameColor.gameRed, context);
//                             }else if (passCont.text.isEmpty || passCont.text.length <8 ) {
//                               Utils.show("Please enter password.",color: GameColor.gameRed, context);
//                             }else{
//                               Navigator.pushNamed(context, RoutesName.otpScreen);
//                             }
//                           },
//                           alignment: Alignment.center,
//                           height: height * 0.06,
//                           widths: width * 0.5,
//                           color: GameColor.blue,
//                           borderRadius: const BorderRadius.all(Radius.circular(35)),
//                           child: const Text(
//                             "Register",
//                             style:  TextStyle(
//                                 color: GameColor.white, fontWeight: FontWeight.w500),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//
//           ],
//         ),
//       ),
//     );
//   }
//   List<Particle> createParticles() {
//     var rng = Random();
//     List<Particle> particles = [];
//     for (int i = 0; i < 140; i++) {
//       particles.add(Particle(
//         color: GameColor.bg,
//         size: rng.nextDouble() * 10,
//         velocity: Offset(rng.nextDouble() * 50 * randomSign(),
//             rng.nextDouble() * 50 * randomSign()),
//       ));
//     }
//     return particles;
//   }
//
//   double randomSign() {
//     var rng = Random();
//     return rng.nextBool() ? 1 : -1;
//   }
// }
