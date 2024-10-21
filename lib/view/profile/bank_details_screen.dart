
import 'package:flutter/material.dart';
import 'package:future_trade/res/color-const.dart';
import 'package:future_trade/res/constantButton.dart';
import 'package:future_trade/res/constant_app_bar.dart';
import 'package:future_trade/res/custom_text_field.dart';
import 'package:future_trade/utils/utils.dart';

class BankDetailsScreen extends StatefulWidget {
  const BankDetailsScreen({super.key});

  @override
  State<BankDetailsScreen> createState() => _BankDetailsScreenState();
}

bool _loading = false;

class _BankDetailsScreenState extends State<BankDetailsScreen> {
  TextEditingController accountNoCont = TextEditingController();
  TextEditingController ifscCont = TextEditingController();
  TextEditingController branchCont = TextEditingController();
  TextEditingController bankNameCont = TextEditingController();
  TextEditingController upiCont = TextEditingController();
  TextEditingController acHolderCont = TextEditingController();

  @override
  void initState() {
    super.initState();
  }


  bool _isValidifscCont = false;

  void validateifscCont(String ifscCont) {
    // Regular expression for ifscCont code validation
    RegExp ifscContRegex = RegExp(r'^[A-Z]{4}0[A-Z0-9]{6}$');

    setState(() {
      _isValidifscCont = ifscContRegex.hasMatch(ifscCont.toUpperCase());
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: GameColor.black,

          appBar:  ConstantAppBar(
            leading: GestureDetector(
                onTap: (){Navigator.pop(context);},
                child: const Icon(Icons.arrow_back,color: GameColor.white,)),
            title: const Text(
              "Bank Details",
              style: TextStyle(fontWeight: FontWeight.w600, color: GameColor.white),
            ),
            centerTitle: true,
          ),
          body: ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(20),
            children: [
              const SizedBox(
                height: 50,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  color: GameColor.white,
                  boxShadow: const [
                    BoxShadow(
                      color: GameColor.secondaryColor, //New
                      blurRadius: 10,
                    ),
                  ],
                ),

                child: ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  children: [
                    CustomTextField(
                      controller: acHolderCont,
                      // focusNode: focusyear,
                      keyboardType: TextInputType.name,
                      textAlignVertical: TextAlignVertical.bottom,
                      style:  TextStyle(color: GameColor.black),
                      prefix: Icon(Icons.person,color: GameColor.black,) ,
                      label: " A/c holder name" ,
                      filled: false,
                      border: Border.all(color: GameColor.purple),
                      borderRadius: BorderRadius.circular(25),
                      fieldRadius:  BorderRadius.circular(25),

                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      controller: accountNoCont,
                      // focusNode: focusyear,
                      keyboardType: TextInputType.name,
                      textAlignVertical: TextAlignVertical.bottom,
                      style:  TextStyle(color: GameColor.black),
                      filled: false,
                      border: Border.all(color:  GameColor.purple),
                      borderRadius: BorderRadius.circular(25),
                      fieldRadius:  BorderRadius.circular(25),
                      prefix: Icon(
                        Icons.account_balance,
                        color: GameColor.black,
                      ),
                      label:"Account No" ,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      controller: bankNameCont,
                      // focusNode: focusyear,
                      keyboardType: TextInputType.name,
                      textAlignVertical: TextAlignVertical.bottom,
                      style:  TextStyle(color: GameColor.black),
                      filled: false,
                      border: Border.all(color:  GameColor.purple),
                      borderRadius: BorderRadius.circular(25),
                      fieldRadius:  BorderRadius.circular(25),
                      prefix:  Icon(
                        Icons.account_balance_outlined,
                          color: GameColor.black
                      ),
                      label:"Bank Name" ,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      controller: branchCont,
                      // focusNode: focusyear,
                      keyboardType: TextInputType.name,
                      textAlignVertical: TextAlignVertical.bottom,
                      style:  TextStyle(color:GameColor.black),
                      // cursorColor: const Color(0xFF075E54),
                      filled: false,
                      border: Border.all(color:  GameColor.purple),
                      borderRadius: BorderRadius.circular(25),
                      fieldRadius:  BorderRadius.circular(25),
                      prefix:  Icon(
                        Icons.account_balance_sharp,
                          color: GameColor.black
                      ),
                      label: "Branch Name",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      controller: ifscCont,
                      // focusNode: focusyear,
                      onChanged: (value) {
                        validateifscCont(value.toUpperCase());
                      },
                      maxLength: 11,
                      keyboardType: TextInputType.name,
                      textAlignVertical: TextAlignVertical.bottom,
                      style:  TextStyle(color:GameColor.black),
                      filled: false,
                      border: Border.all(color: GameColor.purple),
                      borderRadius: BorderRadius.circular(25),
                      fieldRadius:  BorderRadius.circular(25),
                      prefix:  Icon(
                        Icons.pin,
                          color: GameColor.black
                      ),
                      label:"IFSC Code" ,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ConstantButton(
                      text: 'UPDATE',
                      textColor: Colors.white,
                      onTap: () async {
                        // bool ifscContValid = validateifscCont(ifscCont.text);
                        if(acHolderCont.text.isEmpty){
                          Utils.show(
                            "Please enter valid A/c holder name",color: GameColor.gameRed, context, );
                        }
                        else if(accountNoCont.text.isEmpty){
                          Utils.show(
                            "Please enter valid account no",color: GameColor.gameRed, context, );
                        } else if(bankNameCont.text.isEmpty){
                          Utils.show(
                            "Please enter valid bank name",color: GameColor.gameRed, context, );
                        } else if(
                        branchCont.text.isEmpty
                        ){
                          Utils.show(
                            "Please enter valid branch name",color: GameColor.gameRed, context, );
                        }
                       else if (_isValidifscCont) {
                          // If ifscCont is valid, proceed with adding the account
                          Utils.show(
                            "Account add successfully",color: GameColor.lightGreen, context, );
                        } else {
                          Utils.show(
                              "Please enter valid ifscCont",color: GameColor.gameRed, context, );
                        }
                        print(ifscCont.text);
                        // Addaccount(accountNoCont.text, ifscCont.text, branchCont.text,
                        //     bankNameCont.text, acHolderCont.text);
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }


}
