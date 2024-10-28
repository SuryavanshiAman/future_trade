import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:future_trade/generated/assets.dart';
import 'package:future_trade/res/color-const.dart';
import 'package:future_trade/utils/routes/routes_name.dart';
import 'package:future_trade/view_model/user_view_model.dart';
import '../main.dart';

class Utils {
  static void flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        message: message,
        forwardAnimationCurve: Curves.decelerate,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        padding: const EdgeInsets.all(15),
        duration: const Duration(seconds: 3),
        flushbarPosition: FlushbarPosition.TOP,
        backgroundColor: GameColor.gameRed,
        borderRadius: BorderRadius.circular(20),
        // reverseAnimationCurve: Curves.easeInOutCubic,
        positionOffset: 20,
        icon: const Icon(
          Icons.error_outline,
          size: 30,
          color: Colors.white,
        ),
      )..show(context),
    );
  }

  static void flushBarSuccessMessage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        message: message,
        forwardAnimationCurve: Curves.decelerate,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        padding: const EdgeInsets.all(15),
        duration: const Duration(seconds: 3),
        flushbarPosition: FlushbarPosition.TOP,
        backgroundColor: GameColor.green,
        borderRadius: BorderRadius.circular(20),
        positionOffset: 20,
        icon: const Icon(
          Icons.check_circle_outline,
          size: 30,
          color: Colors.white,
        ),
      )..show(context),
    );
  }

  static showExitConfirmation(BuildContext context) async {
    return await showModalBottomSheet(
          elevation: 5,
          backgroundColor: GameColor.black,
          shape: const RoundedRectangleBorder(
              side: BorderSide(width: 2, color: Colors.white),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35), topRight: Radius.circular(35))),
          context: context,
          builder: (context) {
            return Container(
              height: height * 0.45,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 28.0, top: 28),
                    child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.close,
                          color: GameColor.white,
                        )),
                  ),
                  SizedBox(height: height / 30),
                  const Center(
                    child: Text("Exit App",
                        style: TextStyle(
                            color: GameColor.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: height * 0.02),
                  const Center(
                    child: Text("Are you sure want to exit app?",
                        style: TextStyle(
                            color: GameColor.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                  ),
                  SizedBox(height: height * 0.04),
                  Center(
                    child: SizedBox(
                      width: width * 4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: GameColor.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(55)),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width * 0.34,
                                      vertical: height * 0.02)),
                              onPressed: () {
                                SystemNavigator.pop();
                              },
                              child: const Text("Yes",
                                  style: TextStyle(
                                      color: GameColor.blue,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold))),
                          SizedBox(height: height * 0.03),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: GameColor.white,
                                  side: const BorderSide(
                                      width: 1, color: GameColor.white),
                                  // elevation: 3,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(55)),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width * 0.34,
                                      vertical: height * 0.02)),
                              onPressed: () {
                                Navigator.pop(context, false);
                              },
                              child: Text("No",
                                  style: TextStyle(
                                      color: GameColor.gameRed,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold))),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ) ??
        false;
  }

  static showLogOutConfirmation(BuildContext context) async {
    return await showModalBottomSheet(
          elevation: 5,
          backgroundColor: GameColor.black,
          shape: const RoundedRectangleBorder(
              side: BorderSide(width: 2, color: Colors.white),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35), topRight: Radius.circular(35))),
          context: context,
          builder: (context) {
            return Container(
              height: height * 0.5,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 28.0, top: 28),
                    child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.close,
                          color: GameColor.white,
                        )),
                  ),
                  // SizedBox(height: height*0.02),
                  Center(
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: GameColor.white,
                      child: Image.asset(
                        Assets.imagesLogOut,
                        color: GameColor.blue,
                        scale: 2,
                      ),
                    ),
                  ),
                  const Center(
                    child: Text("Logging out?",
                        style: TextStyle(
                            color: GameColor.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w600)),
                  ),
                  SizedBox(height: height * 0.02),
                  const Center(
                    child: Text(
                        "Are you sure want to log out of this\naccount?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: GameColor.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                  ),
                  SizedBox(height: height * 0.04),
                  Center(
                    child: PopScope(
                      canPop: false,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: GameColor.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(55),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: width * 0.29,
                            vertical: height * 0.02,
                          ),
                        ),
                        onPressed: () {
                          UserViewModel userViewModel = UserViewModel();
                          userViewModel.remove();
                          Navigator.of(context, rootNavigator: true).pop();
                          Navigator.pushReplacementNamed(
                              context, RoutesName.loginScreen);
                        },
                        child: Text(
                          "Yes, Logout",
                          style: TextStyle(
                            color: GameColor.green,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.03),
                  Center(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: const BorderSide(
                                width: 1, color: GameColor.white),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(55)),
                            padding: EdgeInsets.symmetric(
                                horizontal: width * 0.34,
                                vertical: height * 0.02)),
                        onPressed: () {
                          Navigator.pop(context, false);
                        },
                        child: Text("Cancel",
                            style: TextStyle(
                                color: GameColor.gameRed,
                                fontSize: 16,
                                fontWeight: FontWeight.bold))),
                  ),
                ],
              ),
            );
          },
        ) ??
        false;
  }
}
