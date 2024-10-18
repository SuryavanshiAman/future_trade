import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:future_trade/main.dart';
import 'package:future_trade/res/app_constant.dart';
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
  Color _containerColor = GameColor.lightGreeColor;
  // UserViewModel userViewModel = UserViewModel();
  @override
  void initState() {
    super.initState();
    // login();
    _controller.addListener(_updateContainerColor);
  }
  // login()async{
  //   String? userId = await userViewModel.getUser();
  //   print(":uuuuu${userId}");
  // }
  void _updateContainerColor() {
    setState(() {
      if (_controller.text.length == 10) {
        _containerColor = GameColor.secondaryColor;
      } else {
        _containerColor = GameColor.lightGreeColor;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // final authApi = Provider.of<AuthViewModel>(context);
    return Scaffold(
      backgroundColor: GameColor.white,
      // appBar: AppBar(
      //   leadingWidth: width*0.6,
      //   backgroundColor: GameColor.pink,
      //   leading: Row(
      //     children: [
      //       GestureDetector(
      //         onTap: () {
      //           Navigator.pushNamed(context, RoutesName.registerScreen);
      //         },
      //         child:  Icon(
      //           Icons.keyboard_arrow_left_rounded,
      //           color: GameColor.black,
      //           size: 30,
      //         ),
      //       ),
      //        const Text(
      //         "     ${AppConstants.appName}",
      //         style: TextStyle(
      //             color: GameColor.white, fontSize: 26, fontWeight: FontWeight.w900),
      //       ),
      //     ],
      //   ),
      //   actions: [
      //     InkWell(
      //       onTap: () {
      //         Navigator.pop(context);
      //       },
      //       child: const Text(
      //         "NEW USER ?",
      //         style: TextStyle(
      //             color: GameColor.white, fontWeight: FontWeight.w600, fontSize: 16),
      //       ),
      //     ),
      //     SizedBox(
      //       width: width * 0.08,
      //     )
      //   ],
      // ),
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
                height: height * 0.26,
              ),
              // Image(image: const AssetImage("assets/images/login.png",),height: height*0.3,),
               Column(
                 children: [
                   SizedBox(
                     height: height * 0.1,
                   ),
                   Container(
                     width: width*0.9,
                     height: height*0.4,
                     padding: EdgeInsets.all(35),
                     decoration: BoxDecoration(
                       color: GameColor.black,
                       shape: BoxShape.circle,
                       // borderRadius: BorderRadius.circular(20),
                       boxShadow: [
                       BoxShadow(
                         color: GameColor.secondaryColor, //New
                         blurRadius: 10,
                     ),

                   ],
                     ),
                     child: Column(
                       children: [
                         const Center(
                          child: Text(
                            "Sign in",
                            style:  TextStyle(
                                color: Color(0xfff9d4fa)
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
                           hintColor: GameColor.white,
                           hintSize: 16,

                           // height: 70,
                           width: width * 0.65,
                           maxLength: 11,
                           filled: false,
                           border: Border.all(color: const Color(0xfff9d4fa)),
                           borderRadius: BorderRadius.circular(25),
                           fieldRadius:  BorderRadius.circular(25),
                           prefix:  const Padding(
                             padding: EdgeInsets.all(15.0),
                             child: Text(
                               "+91",
                               style: TextStyle(color: GameColor.white, fontSize: 16),
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
                               const TextSpan(
                                   text: "Don't have an ID?",
                                   style:  TextStyle(color: GameColor.white)),
                               TextSpan(
                                 text: 'Register',
                                 style:  TextStyle(
                                   color: GameColor.primaryColor,
                                   fontWeight: FontWeight.w600,
                                   decoration: TextDecoration.underline,
                                 ),
                                 recognizer: TapGestureRecognizer()..onTap = () {},
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
                             }
                           },
                           alignment: Alignment.center,
                           height: height * 0.06,
                           widths: width * 0.5,
                           color: _containerColor,
                           gradient: LinearGradient(
                               colors: [
                                 const Color(0xff500860).withOpacity(0.9),
                                 const Color(0xff500860).withOpacity(0.9),
                               ],
                               begin: Alignment.topCenter,
                               end: Alignment.bottomCenter
                           ),
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


                 ],
               ),

            ],
          ),
        ),
      ),
    );
  }
}
