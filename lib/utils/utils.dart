import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:future_trade/res/color-const.dart';
import 'dart:async';

import '../main.dart';

class Utils {
  static OverlayEntry? _overlayEntry;
  static bool _isShowing = false;

  static void show(String message, BuildContext context,{Color? color}) {
    if (_isShowing) {
      _overlayEntry?.remove();
    }

    _overlayEntry = OverlayEntry(
      builder: (BuildContext context) => Center(
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            decoration: BoxDecoration(
              color:Colors.black.withOpacity(0.8),
              borderRadius: BorderRadius.circular(24.0),
              boxShadow:  [
                BoxShadow(
                  color:  color??GameColor.secondaryColor, //New
                  blurRadius: 5,
                ),

              ],
            ),
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
    _isShowing = true;

    _startTimer();
  }

  static void _startTimer() {
    Timer(const Duration(seconds: 2), () {
      if (_overlayEntry != null) {
        _overlayEntry!.remove();
        _isShowing = false;
      }
    });
  }




  static OverlayEntry? _overlayImgEntry;
  static bool _isShowingImg = false;

  static void showImage(String imagePath, BuildContext context, {int duration = 2}) {
    if (_isShowingImg) {
      _overlayImgEntry?.remove();
    }

    _overlayImgEntry = OverlayEntry(
      builder: (BuildContext context) => Center(
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: width,
            height: width*0.05,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(imagePath),fit: BoxFit.fill)
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayImgEntry!);
    _isShowingImg = true;

    _startImgTimer(duration);
  }

  static void _startImgTimer(int duration) {
    Timer(Duration(seconds: duration), () {
      if (_overlayImgEntry != null) {
        _overlayImgEntry!.remove();
        _isShowingImg = false;
      }
    });
  }
  static showExitConfirmation(BuildContext context) async {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
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
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.close,color: GameColor.white,)),
              ),
              SizedBox(height: height / 30),
               const Center(
                child: Text("Exit App",
                    style: TextStyle(
                        color: GameColor.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: height*0.02),
               const Center(
                child: Text("Are you sure want to exit app?",
                    style: TextStyle(
                      color:GameColor.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600
                    )),
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
                            // side:
                            // BorderSide(width: 1, color: Colors.white),
                            // elevation: 3,
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
                                  color: GameColor.purple,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold))),
                      SizedBox(height: height * 0.03),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: GameColor.white,
                              side:  const BorderSide(width: 1,color: GameColor.white),
                              // elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(55)),
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.34,
                                  vertical: height * 0.02)),
                          onPressed: () {
                            Navigator.pop(context, false);
                          },
                          child:  Text("No",
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
}