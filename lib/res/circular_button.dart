import 'package:flutter/material.dart';
import 'package:future_trade/res/color-const.dart';



class CircularButton extends StatefulWidget {
   const CircularButton({
    super.key,

    this.btnColor ,
    this.textColor ,
    this.border,
  });



  final Color? btnColor;
  final Color? textColor;
  final BoxBorder? border;

  @override
  State<CircularButton> createState() => _CircularButtonState();
}

class _CircularButtonState extends State<CircularButton> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Ink(
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                100
            ),
          ),
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: widget.btnColor??GameColor.green,
              borderRadius: BorderRadius.circular(
                100,
              ),
              border: widget.border ,
            ),
            child: const Center(
                child: CircularProgressIndicator(color:GameColor.white,)
            ),
          ),
        ),
      ),
    );
  }



}