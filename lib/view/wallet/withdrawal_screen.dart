import 'package:future_trade/main.dart';
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
  int _selectedItemIndex = 10;

  List<int> dataItems = [300, 500, 1000, 2000, 5000, 10000, 49999];
  void _handleListItemSelected(int index) {
    setState(() {
      _selectedItemIndex = dataItems[index];
      amount.text = dataItems[index].toString();
    });
  }

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
            SizedBox(
              height: height * 0.05,
            ),
            Row(
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
            SizedBox(
              height: height * 0.05,
            ),
            Card(
              elevation: 3,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(18))),
              child: Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: GameColor.white,
                  border: Border.all(color: GameColor.blue),
                  borderRadius: BorderRadius.circular(15),
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
                                          color: GameColor.blue),
                                      borderRadius: BorderRadius.circular(12)),
                                  color: _selectedItemIndex == dataItems[index]
                                      ? GameColor.blue
                                      : GameColor.white,
                                  child: Center(
                                    child: Text(
                                      '₹ ${dataItems[index]}',
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
                                            ? const SizedBox(
                                                height: 12,
                                                width: 12,
                                                child: CircleAvatar(
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
                                  const BorderSide(color: GameColor.blue),
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
                                _passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.grey,
                              ),
                              onPressed: () {
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
                    Utils.flushBarErrorMessage("Enter Amount", context);
                  } else if (password.text.isEmpty) {
                    Utils.flushBarErrorMessage("Enter Password ", context);
                  } else {
                    Utils.flushBarErrorMessage(
                        "Amount withdrawal successfully", context);
                  }
                },
                text: 'WITHDRAWAL REQUEST')
          ]),
    ));
  }
}
