import 'package:flutter/material.dart';
import 'package:future_trade/generated/assets.dart';
import 'package:future_trade/main.dart';
import 'package:future_trade/res/color-const.dart';
import 'package:future_trade/res/constantButton.dart';
import 'package:future_trade/res/constant_app_bar.dart';

class ReferEarnScreen extends StatefulWidget {
  const ReferEarnScreen({super.key});

  @override
  State<ReferEarnScreen> createState() => _ReferEarnScreenState();
}

class _ReferEarnScreenState extends State<ReferEarnScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: GameColor.black,
      appBar: const ConstantAppBar(
        title: Text(
          "Refer&Earn",
          style: TextStyle(fontWeight: FontWeight.w600, color: GameColor.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 3,
              child: Container(
                height: height * 0.35,
                width: width * 0.99,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: GameColor.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Invitation code",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: GameColor.black,
                          fontSize: 20),
                    ),
                    Text(
                      "448520",
                      style: TextStyle(
                          fontSize: 20,
                          color: GameColor.black,
                          fontWeight: FontWeight.w900),
                    ),
                    Text(
                      "invite link",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: GameColor.black,
                          fontSize: 16),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: height * 0.07,
                      width: width * 0.7,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: GameColor.gray,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(2)),
                          color: GameColor.white),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "https://www.FutureTrade.co/h5/register/448520",
                          style: TextStyle(
                            color: GameColor.gray,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    ConstantButton(
                      onTap: () {
                        // Share.share('check out my website https://example.com');
                      },
                      text: 'Copy invitation link',
                      btnColor: GameColor.blue,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 1,
                width: width * 0.3,
                color: GameColor.white,
              ),
              const Text("Invitation History",
                  style: TextStyle(
                      color: GameColor.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18)),
              Container(
                height: 1,
                width: width * 0.3,
                color: GameColor.white,
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 16,
                itemBuilder: (BuildContext context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: GameColor.white,

                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: GameColor.blue.withOpacity(0.9),
                          backgroundImage:
                              const AssetImage(
                                  Assets.imagesUser),
                        ),
                        title: Text("Aman",
                            style: TextStyle(
                                color: GameColor.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 14)),
                        subtitle: const Text("Not purchase any product",
                            style: TextStyle(
                                color: GameColor.blue,
                                fontWeight: FontWeight.w600,
                                fontSize: 14)),
                        trailing: Text(
                          "Pending",
                          style: TextStyle(
                              color: GameColor.gameRed,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
                        ),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    ));
  }
  // Future<void> share() async {
  //
  //   await Share.share(
  //       "https://www.FutureTrade.co/h5/register/448520",
  //       subject: 'Referral Code :448520');
  //
  // }
}
