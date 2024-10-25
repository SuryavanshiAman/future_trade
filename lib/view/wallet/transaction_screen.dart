import 'package:flutter/material.dart';
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
          padding: const EdgeInsets.all(8.0),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: GameColor.white))
              ),
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: GameColor.blue,
                  child: Text(
                      "RO",
                      style:  TextStyle(
                          color: GameColor.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600)) ,
                ) ,
                title:    const Text(
                    "Rohit",
                    style:  TextStyle(
                        color: GameColor.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600)),
                subtitle:  const Text(
                    "Deposit on 23 Oct, 08:56 am",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: GameColor.white,
                        fontSize: 14)),
                trailing:  Text(
                    "+₹10",
                    style:  TextStyle(
                        color:  GameColor.green,
                        fontSize: 16,
                        fontWeight: FontWeight.w600)),
              ),
            );
          }),
    );
  }
}
