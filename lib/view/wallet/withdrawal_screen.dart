import 'package:future_trade/res/color-const.dart';
import 'package:future_trade/res/constantButton.dart';
import 'package:future_trade/res/constant_app_bar.dart';
import 'package:future_trade/utils/utils.dart';
import 'package:flutter/material.dart';

class WithdrawPage extends StatefulWidget {
  const WithdrawPage({Key? key}) : super(key: key);

  @override
  State<WithdrawPage> createState() => _WithdrawPageState();
}

class _WithdrawPageState extends State<WithdrawPage> {
  TextEditingController amount = TextEditingController();
  TextEditingController password = TextEditingController();
  int _selectedItemIndex =
      10; // Initialize with a value that won't match any index
  bool _isButtonEnabled = false;
  List<int> dataItems = [300, 500, 1000, 2000, 5000, 10000, 49999];
  void _handleTextChange() {
    setState(() {
      _selectedItemIndex = 10; // Reset selected index
      _isButtonEnabled = amount.text.isNotEmpty;
    });
  }

  void _handleListItemSelected(int index) {
    setState(() {
      _selectedItemIndex = dataItems[index];
      amount.text = dataItems[index].toString(); // Update TextFormField text
      _isButtonEnabled = true;
    });
  }

  TextEditingController Bank_Name = TextEditingController();
  TextEditingController UPI = TextEditingController();
  TextEditingController Ac_holder = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  bool _passwordVisible = false;
  @override
  void dispose() {
    amount.dispose();
    super.dispose();
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
          "Withdrawal",
          style: TextStyle(fontWeight: FontWeight.w600, color: GameColor.white),
        ),
        centerTitle: true,
      ),
      body: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  'BALANCE : ',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: GameColor.white,
                      fontSize: 20),
                ),
                const Text(
                  "1000",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: GameColor.white,
                      fontSize: 16),
                ),
                Container(
                  height: 15,
                  width: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: GameColor.white,
                  ),
                  child: const Center(
                      child: Text(
                    'ALL',
                    style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
                  )),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Card(
              elevation: 3,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(18))),
              child: Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: GameColor.white,
                  border: Border.all(color: GameColor.purple),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    const BoxShadow(
                      color: GameColor.secondaryColor, //New
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 130,
                                childAspectRatio: 3.5 / 1.5,
                                mainAxisSpacing: 5),
                        itemCount: dataItems.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return GestureDetector(
                            onTap: () {
                              _handleListItemSelected(index);
                            },
                            child: Stack(
                              children: [
                                Card(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          color: GameColor.purple),
                                      borderRadius: BorderRadius.circular(12)),
                                  color: _selectedItemIndex == dataItems[index]
                                      ? GameColor.purple
                                      : GameColor.white,
                                  child: Center(
                                    child: Text(
                                      '₹  ' + dataItems[index].toString(),
                                      style: TextStyle(
                                          color: GameColor.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ),
                                ),
                                Positioned(
                                    top: 5,
                                    right: 5,
                                    child:
                                        _selectedItemIndex == dataItems[index]
                                            ? Container(
                                                height: 12,
                                                width: 12,
                                                child: const CircleAvatar(
                                                  child: Icon(
                                                    Icons.check_outlined,
                                                    size: 10,
                                                  ),
                                                ),
                                              )
                                            : Container()),
                              ],
                            ),
                          );
                        }),
                    const SizedBox(
                      height: 16,
                    ),
                    Card(
                      elevation: 5,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                      child: TextField(
                        controller: amount,
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: GameColor.black),
                        onChanged: (text) {
                          _handleTextChange();
                        },
                        decoration: InputDecoration(
                            prefixIcon: SizedBox(
                              width: 70,
                              child: Row(
                                children: [
                                  const SizedBox(width: 10),
                                  const Icon(
                                    Icons.currency_rupee,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(width: 10),
                                  Container(
                                      height: 30, color: Colors.grey, width: 2)
                                ],
                              ),
                            ),
                            hintText: "Enter Withdraw Amount",
                            helperStyle: TextStyle(
                                fontSize: 10, color: Colors.grey.shade200),
                            border: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: GameColor.purple),
                              borderRadius: BorderRadius.circular(25),
                            )),
                        cursorColor: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Card(
                      elevation: 5,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                      child: TextField(
                        controller: password,
                        textAlign: TextAlign.start,
                        obscureText: !_passwordVisible,
                        keyboardType: TextInputType.visiblePassword,
                        style: TextStyle(color: GameColor.black),
                        decoration: InputDecoration(
                            prefixIcon: SizedBox(
                              width: 70,
                              child: Row(
                                children: [
                                  const SizedBox(width: 10),
                                  const Icon(
                                    Icons.password,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(width: 10),
                                  Container(
                                      height: 30, color: Colors.grey, width: 2)
                                ],
                              ),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                // Based on passwordVisible state choose the icon
                                _passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                // Update the state i.e. toogle the state of passwordVisible variable
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            ),
                            hintText: "Enter Password",
                            helperStyle: TextStyle(
                                fontSize: 10, color: Colors.grey.shade200),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(25),
                            )),
                        cursorColor: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(
              height: 30,
            ),
            ConstantButton(
                onTap: () {
                  if (amount.text.isEmpty) {
                    Utils.show(
                        "Enter Amount", color: GameColor.gameRed, context);
                  } else if (password.text.isEmpty) {
                    Utils.show(
                        "Enter Password ", color: GameColor.gameRed, context);
                  } else {
                    Utils.show(
                        "Amount withdrawal successfully",
                        color: GameColor.lightGreen,
                        context);
                  }
                },
                text: 'WITHDRAWAL REQUEST')
          ]),
    ));
  }
}
