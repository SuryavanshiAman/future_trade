import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:future_trade/main.dart';
import 'package:future_trade/res/color-const.dart';
import 'package:future_trade/res/constant_app_bar.dart';
import 'package:future_trade/res/custom_container.dart';
import 'package:future_trade/utils/routes/routes_name.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GameColor.black,
      appBar: const ConstantAppBar(
        title: Text(
          "Wallet",
          style: TextStyle(fontWeight: FontWeight.w600, color: GameColor.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: height * 0.03,
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.all(18),
              width: width * 0.9,
              decoration:  const BoxDecoration(
                  color: GameColor.white,
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: GameColor.secondaryColor, //New
                  //     blurRadius: 10,
                  //   ),
                  // ],
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: "  Total Balance",
                        style:  TextStyle(fontSize: 16, color: GameColor.black),
                        children: [
                          TextSpan(
                            text: "  ⓘ",
                            style:  TextStyle(
                              color: GameColor.black,
                              fontWeight: FontWeight.w900,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // _showBottomSheet(context);
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                   Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(image: AssetImage("assets/images/cash.png",),height: height*0.05,),

                        Text(" ₹100",
                          style: TextStyle(
                              fontSize: 36, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Deposits",
                            style:  TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: GameColor.gray),
                          ),
                          const Text(
                            "₹100",
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, RoutesName.depositScreen);
                        },
                        child: CustomContainer(
                            height: height * 0.06,
                            widths: width * 0.35,
                            color: GameColor.purple,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(25),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                 Icon(
                                  Icons.add,
                                  color: GameColor.white,
                                ),
                                Text(
                                  "Add Cash",
                                  style:  TextStyle(
                                      color: GameColor.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            )),
                      )
                    ],
                  ),
                  Divider(
                    height: height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Withdraw",
                            style:  TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: GameColor.gray),
                          ),
                          const Text(
                            "₹100",
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      CustomContainer(
                          onTap: () {
                            Navigator.pushNamed(
                                context, RoutesName.withdrawPage);
                          },
                          height: height * 0.06,
                          widths: width * 0.35,
                          color:Color(0xff3bad19),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(25),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                               Icon(
                                Icons.arrow_downward,
                                color: GameColor.white,
                              ),
                              Text(
                                "Withdraw",
                                style:  TextStyle(
                                    color: GameColor.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700),
                              )
                            ],
                          ))
                    ],
                  ),
                  Divider(
                    height: height * 0.03,
                  ),
                  Text(
                    "Bonus Reward",
                    style:  TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: GameColor.gray),
                  ),
                  const Text("₹100",
                    style: TextStyle(
                        fontSize: 28, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: CustomContainer(
                padding: const EdgeInsets.all(15),
                height: height * 0.1,
                widths: width,
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                color:GameColor.white,
                // boxShadow: [
                //   const BoxShadow(
                //     color: GameColor.secondaryColor, //New
                //     blurRadius: 10,
                //   ),
                // ],
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.transactionScreen);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Transaction History",
                        style: TextStyle(
                          // color: tertiary,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: width * 0.01,
                      ),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 22,
                      ),
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }

  // void _showBottomSheet(BuildContext context) {
  //   showModalBottomSheet(
  //     context: context,
  //     builder: (context) {
  //       return Container(
  //         padding: const EdgeInsets.all(16.0),
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           crossAxisAlignment: CrossAxisAlignment.end,
  //           children: [
  //             InkWell(
  //                 onTap: () {
  //                   Navigator.pop(context);
  //                 },
  //                 child: const Icon(Icons.cancel_outlined)),
  //             _buildListItem(
  //               image: Assets.imagesDeposit,
  //               title: 'Deposits',
  //               description: 'This money can be used to play tournaments.',
  //             ),
  //             _buildListItem(
  //               image: Assets.imagesRupeesWhite,
  //               title: 'Winnings',
  //               description:
  //               'The money you have won by playing tournaments. You can withdraw this money.',
  //             ),
  //             _buildListItem(
  //               image: Assets.imagesCashback,
  //               title: 'Cashback',
  //               description:
  //               'Earn Cashback by performing certain actions such as adding money to your wallet, completing KYC etc.',
  //             ),
  //             _buildListItem(
  //               image: Assets.imagesBonus,
  //               title: 'Bonus',
  //               description:
  //               'Bonus can be used to unlock rewards or new features.',
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }
  //
  // Widget _buildListItem(
  //     {required String image,
  //       required String title,
  //       required String description}) {
  //   return Center(
  //     child: ListTile(
  //       leading: CircleAvatar(
  //           radius: 30, backgroundColor: lightBlue, child: Image.asset(image)),
  //       // Icon(icon, color: Colors.purple),
  //       title: Text(title,
  //           style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
  //       subtitle: Text(description,
  //           style: const TextStyle(
  //               fontWeight: FontWeight.w500, color: labelColor)),
  //     ),
  //   );
  // }
}
