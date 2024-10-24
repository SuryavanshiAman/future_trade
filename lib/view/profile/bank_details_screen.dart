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
      appBar: ConstantAppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: GameColor.white,
            )),
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
                  keyboardType: TextInputType.name,
                  textAlignVertical: TextAlignVertical.bottom,
                  style: TextStyle(color: GameColor.black),
                  prefix: Icon(
                    Icons.person,
                    color: GameColor.black,
                  ),
                  label: " A/c holder name",
                  filled: false,
                  border: Border.all(color: GameColor.purple),
                  borderRadius: BorderRadius.circular(25),
                  fieldRadius: BorderRadius.circular(25),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: accountNoCont,
                  keyboardType: TextInputType.name,
                  textAlignVertical: TextAlignVertical.bottom,
                  style: TextStyle(color: GameColor.black),
                  filled: false,
                  border: Border.all(color: GameColor.purple),
                  borderRadius: BorderRadius.circular(25),
                  fieldRadius: BorderRadius.circular(25),
                  prefix: Icon(
                    Icons.account_balance,
                    color: GameColor.black,
                  ),
                  label: "Account No",
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: bankNameCont,
                  keyboardType: TextInputType.name,
                  textAlignVertical: TextAlignVertical.bottom,
                  style: TextStyle(color: GameColor.black),
                  filled: false,
                  border: Border.all(color: GameColor.purple),
                  borderRadius: BorderRadius.circular(25),
                  fieldRadius: BorderRadius.circular(25),
                  prefix: Icon(Icons.account_balance_outlined,
                      color: GameColor.black),
                  label: "Bank Name",
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: branchCont,
                  keyboardType: TextInputType.name,
                  textAlignVertical: TextAlignVertical.bottom,
                  style: TextStyle(color: GameColor.black),
                  // cursorColor: const Color(0xFF075E54),
                  filled: false,
                  border: Border.all(color: GameColor.purple),
                  borderRadius: BorderRadius.circular(25),
                  fieldRadius: BorderRadius.circular(25),
                  prefix:
                      Icon(Icons.account_balance_sharp, color: GameColor.black),
                  label: "Branch Name",
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: ifscCont,
                  onChanged: (value) {
                    validateifscCont(value.toUpperCase());
                  },
                  maxLength: 11,
                  keyboardType: TextInputType.name,
                  textAlignVertical: TextAlignVertical.bottom,
                  style: TextStyle(color: GameColor.black),
                  filled: false,
                  border: Border.all(color: GameColor.purple),
                  borderRadius: BorderRadius.circular(25),
                  fieldRadius: BorderRadius.circular(25),
                  prefix: Icon(Icons.pin, color: GameColor.black),
                  label: "IFSC Code",
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
                    if (acHolderCont.text.isEmpty) {
                      Utils.flushBarErrorMessage(
                          "Please enter valid A/c holder name", context);
                    } else if (accountNoCont.text.isEmpty) {
                      Utils.flushBarErrorMessage(
                          "Please enter valid account no", context);
                    } else if (bankNameCont.text.isEmpty) {
                      Utils.flushBarErrorMessage(
                          "Please enter valid bank name", context);
                    } else if (branchCont.text.isEmpty) {
                      Utils.flushBarErrorMessage(
                          "Please enter valid branch name", context);
                    } else if (!_isValidifscCont) {
                      Utils.flushBarErrorMessage(
                          "Please enter valid ifscCont", context);
                    } else {
                      Utils.flushBarSuccessMessage(
                          "Account add successfully", context);
                    }
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
