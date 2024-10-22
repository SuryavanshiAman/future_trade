import 'package:flutter/material.dart';
import 'package:future_trade/main.dart';
import 'package:future_trade/res/color-const.dart';
import 'package:future_trade/res/constant_app_bar.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GameColor.black,
      appBar:  ConstantAppBar(
        leading: GestureDetector(
            onTap: (){Navigator.pop(context);},
            child: const Icon(Icons.arrow_back,color: GameColor.white,)),
        title: const Text(
          "Transaction History",
          style: TextStyle(fontWeight: FontWeight.w600, color: GameColor.white),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(8),
                height: height * 0.14,
                decoration:  const BoxDecoration(
                    color: GameColor.white,
                    boxShadow: [
                      const BoxShadow(
                        color: GameColor.secondaryColor, //New
                        blurRadius: 10,
                      ),
                    ],
                    borderRadius: BorderRadius.all(
                        Radius.circular(10))),
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/images/deposit.png",
                      scale: 6,
                    ),
                    SizedBox(
                      width: width * 0.04,
                    ),
                    Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      mainAxisAlignment:
                      MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Deposit",
                            style:  TextStyle(
                                color: GameColor.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600)),
                         Text(
                            "Deposit",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: GameColor.green,
                                fontSize: 14)),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.end,
                      mainAxisAlignment:
                      MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("+₹10",
                            style:  TextStyle(
                                color:  GameColor.black,
                                fontWeight: FontWeight.w600)),
                        Text(
                           "21/10/,14:23",
                            style:  TextStyle(
                                color:  GameColor.black,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),

                  ],
                ),
              ),
            );
          }),
    );
  }
}
