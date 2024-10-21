import 'package:flutter/material.dart';
import 'package:future_trade/main.dart';
import 'package:future_trade/res/color-const.dart';
import 'package:future_trade/res/constant_app_bar.dart';
import 'package:future_trade/res/custom_container.dart';
import 'package:future_trade/res/custom_text_field.dart';
import 'package:future_trade/utils/utils.dart';
class DepositScreen extends StatefulWidget {
  const DepositScreen({super.key});

  @override
  State<DepositScreen> createState() => _DepositScreenState();
}

class _DepositScreenState extends State<DepositScreen> {
  final TextEditingController amountCon = TextEditingController();
  int _currentAmount = 0;
  void _updateAmount(int amount) {
    setState(() {
      _currentAmount += amount;
      amountCon.text = _currentAmount.toString();
    });
  }
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: GameColor.black,
      appBar:  ConstantAppBar(
        leading: GestureDetector(
            onTap: (){Navigator.pop(context);},
            child: const Icon(Icons.arrow_back,color: GameColor.white,)),
        title: const Text(
          "Deposit",
          style: TextStyle(fontWeight: FontWeight.w600, color: GameColor.white),
        ),
        centerTitle: true,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.03,
              ),
              Center(
                child: Container(
                  padding: const EdgeInsets.all(18),
                  height: height * 0.3,
                  width: width * 0.9,
                  decoration:  const BoxDecoration(
                      color: GameColor.white,
                      boxShadow: [
                        BoxShadow(
                          color: GameColor.secondaryColor, //New
                          blurRadius: 10,
                        ),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Enter Amount",style: TextStyle(fontSize: 16),),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      CustomTextField(
                        controller: amountCon,
                        keyboardType: TextInputType.number,
                        label: "Enter amount here",
                        style: const TextStyle(fontWeight: FontWeight.w600,color: GameColor.white),
                        hintColor: GameColor.white,
                        height: 70,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                        // borderRadius: ,
                        filled: true,
                        borderSide:  BorderSide(color: GameColor.blue),
                        borderSideFocus:  BorderSide(color: GameColor.blue),
                        fillColor: GameColor.purple.withOpacity(0.6),
                        fieldRadius: const BorderRadius.only(
                            topRight: Radius.circular(10),
                            topLeft: Radius.circular(10)),
                        prefix:  const Padding(
                          padding: EdgeInsets.all(18.0),
                          child: Text("₹",style: TextStyle(color: GameColor.white, fontSize: 18,fontWeight: FontWeight.w600),),
                        ),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildAmountContainer(100),
                          _buildAmountContainer(50),
                          _buildAmountContainer(10),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const Padding(
                padding:  EdgeInsets.all(18.0),
                child: Text("Get cashback on deposit above ₹100",style:  TextStyle(
                    fontSize: 16,
                    color: GameColor.white
                ),),
              ),

            ],
          ),
          Container(
            alignment: Alignment.center,
            height: height*0.1,
            width: width,

            decoration: BoxDecoration(
              color: GameColor.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, -1), // changes position of shadow to the top
                ),
              ],
            ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // depositViewModel.loading==false?
                CustomContainer(
                  onTap: (){
                    if (amountCon.text.isEmpty) {
                      Utils.show("Please Enter the Amount",color:GameColor.gameRed,  context,);
                    } else if (int.parse(amountCon.text) < 100) {
                      Utils.show( "Please Enter the Amount at least ₹100",color:GameColor.gameRed,  context,);

                    } else {
                      Utils.show( "Amount deposited successfully",color:GameColor.lightGreen,  context,);
                      // depositViewModel.depositApi(amountCon.text, context);
                    }
                  },
                  alignment: Alignment.center,
                  height: height*0.07,
                  widths: width*0.8,
                  color: GameColor.purple,
                  borderRadius: const BorderRadius.all(Radius.circular(35)),
                  child:  const Text("Add Money",style:  TextStyle(color: GameColor.white,fontWeight: FontWeight.w500),),
                ),
                Text("100% Secure Payments",style:  TextStyle(color: GameColor.gray),)
              ],
            ),
          )
        ],
      ),
    );
  }
  Widget _buildAmountContainer(int amount) {
    return GestureDetector(
      onTap: () => _updateAmount(amount),
      child: Container(
        width: width*0.23,
        height: height*0.055,
        decoration: BoxDecoration(
            border: Border.all(color: GameColor.black),
            borderRadius: const BorderRadius.all(Radius.circular(10))
        ),
        // color: Colors.blue,
        child: Center(
          child: Text(
            '+ ₹$amount',
            style:  TextStyle(color: GameColor.black, fontSize: 18),
          ),
        ),
      ),
    );
  }
}


