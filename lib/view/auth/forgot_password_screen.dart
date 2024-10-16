
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:future_trade/main.dart';
import 'package:future_trade/res/color-const.dart';
import 'package:future_trade/res/constantButton.dart';
import 'package:future_trade/res/constant_app_bar.dart';
import 'package:future_trade/res/custom_text_field.dart';

class ForgotPassScreen extends StatefulWidget {
  const ForgotPassScreen({super.key});

  @override
  State<ForgotPassScreen> createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<ForgotPassScreen> {
  TextEditingController mobileCont =TextEditingController();
  TextEditingController verifyCont =TextEditingController();
  TextEditingController passCont =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  ConstantAppBar(
        leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back,color: GameColor.white,)),
        title: const Text("Reset Password",style:TextStyle(color: GameColor.white,fontWeight: FontWeight.w600),),
      ),
      body:Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2)
                ),
                child:  CustomTextField(
                  controller: mobileCont,
                  label: "Mobile Number",
                  hintSize: 16,
                  maxLines: 1,
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  prefix: const Icon(Icons.phone_android_outlined),
                  contentPadding: const EdgeInsets.all(18),
                  filled: true,
                  fillColor: GameColor.white,
                ),
              ),
              // SizedBox(height: height*0.02,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Card(
                    elevation: 3,
                    margin: const EdgeInsets.only(top: 25,left: 4,right: 4),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2)
                    ),
                    child: CustomTextField(
                      controller: verifyCont,
                      width: width*0.57,
                      label: "Verification Code",
                      keyboardType: TextInputType.number,
                      maxLength: 4,
                      hintColor: GameColor.gray,
                      hintSize: 16,
                      prefix: const Icon(Icons.message_sharp),
                      contentPadding: const EdgeInsets.all(18),
                      maxLines: 1,
                      filled: true,
                      fillColor: GameColor.white,
                    ),
                  ),
                  ConstantButton(
                    btnColor: GameColor.btnColor,
                    margin: EdgeInsets.only(top: height*0.03),
                    height: height*0.07,
                    width: width*0.25,
                    onTap: (){}, text: "OTP",
                    textColor: GameColor.black,
                  ),
                ],
              ),
              Card(
                elevation: 3,
                margin: const EdgeInsets.only(top: 25,left: 4,right: 4),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2)
                ),
                child: CustomTextField(
                  controller: passCont,
                  label: "New Password",
                  hintColor: GameColor.gray,
                  hintSize: 16,
                  prefix: const Icon(Icons.vpn_key),
                  contentPadding: const EdgeInsets.all(18),
                  maxLines: 1,
                  filled: true,
                  fillColor: GameColor.white,
                ),
              ),
              ConstantButton(
                  margin: EdgeInsets.only(top: height*0.04),
                  height: height*0.06,
                  width: width*0.7,
                  onTap: (){}, text: "Continue"),
            ]

        ),
      ) ,
    );
  }
}
