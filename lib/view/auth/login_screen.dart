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
      appBar: AppBar(
        leadingWidth: width*0.6,
        backgroundColor: GameColor.primaryColor,
        leading: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RoutesName.registerScreen);
              },
              child:  Icon(
                Icons.keyboard_arrow_left_rounded,
                color: GameColor.black,
                size: 30,
              ),
            ),
             const Text(
              "     ${AppConstants.appName}",
              style: TextStyle(
                  color: GameColor.white, fontSize: 26, fontWeight: FontWeight.w900),
            ),
          ],
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Text(
              "NEW USER ?",
              style: TextStyle(
                  color: GameColor.white, fontWeight: FontWeight.w600, fontSize: 16),
            ),
          ),
          SizedBox(
            width: width * 0.08,
          )
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(
            "assets/images/login.png"
          ),fit: BoxFit.fill)
        ),
        child: SingleChildScrollView(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.2,
              ),
              // Image(image: const AssetImage("assets/images/login.png",),height: height*0.3,),
               Center(
                child: Text(
                  "Sign in",
                  style:  TextStyle(
                      color: GameColor.lightGreeColor
                      , fontWeight: FontWeight.w700, fontSize: 24),
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              CustomTextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                label: "Enter your phone number",
                hintColor: GameColor.white,
                hintSize: 18,
                // height: 70,
                width: width * 0.8,
                maxLength: 11,
                // contentPadding:
                // const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                filled: false,
                border: Border.all(color: GameColor.lightGreeColor),
                borderRadius: BorderRadius.circular(25),
                // borderSide: const BorderSide(color: GameColor.white, width: 2),
                // borderSideFocus:  BorderSide(color: GameColor.blue),
                // fillColor: GameColor.secondaryColor.withOpacity(0.4),
                fieldRadius:  BorderRadius.circular(25),
                prefix:  const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    "+91",
                    style: TextStyle(color: GameColor.white, fontSize: 18),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              // authApi.loading==false?
              CustomContainer(
                onTap: () {
                  if (_controller.text.isEmpty || _controller.text.length <10) {
                    Utils.show("Please enter phone no", context);
                  } else {
                    // authApi.authApi(_controller.text.toString(), context);
                  }
                },
                alignment: Alignment.center,
                height: height * 0.07,
                widths: width * 0.8,
                color: _containerColor,
                borderRadius: const BorderRadius.all(Radius.circular(35)),
                child: const Text(
                  "Accept & Continue",
                  style:  TextStyle(
                      color: GameColor.white, fontWeight: FontWeight.w500),
                ),
              ),
                  // :CircularButton(),
              SizedBox(
                height: height * 0.01,
              ),

              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Container(
                  height: 1,
                  width: width * 0.9,
                  color: GameColor.white,
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: const TextStyle(fontSize: 12, color: Colors.black),
                    children: [
                      const TextSpan(
                          text: "By continuing, I hereby confirm that I am 18 years of age or above and I am not playing from Assam, Telangana, Nagaland, Andhra Pradesh, Meghalaya, Sikkim, Arunachal Pradesh and outside India and I agree to the",
                          style:  TextStyle(color: GameColor.white)),
                      TextSpan(
                        text: 'Terms and Conditions',
                        style:  TextStyle(
                          color: GameColor.black,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                      const TextSpan(text: ' and '),
                      TextSpan(
                        text: 'Privacy Policy',
                        style:  TextStyle(
                          color: GameColor.black,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Handle Privacy Policy tap
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
