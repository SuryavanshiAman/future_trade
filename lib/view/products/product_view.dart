import 'package:future_trade/generated/assets.dart';
import 'package:future_trade/main.dart';
import 'package:future_trade/res/color-const.dart';
import 'package:future_trade/res/constantButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:future_trade/res/constant_app_bar.dart';

class ProductViewScreen extends StatefulWidget {
  const ProductViewScreen({super.key, required});

  @override
  State<ProductViewScreen> createState() => _ProductViewScreenState();
}

class _ProductViewScreenState extends State<ProductViewScreen> {
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
          "USD",
          style: TextStyle(fontWeight: FontWeight.w600, color: GameColor.white),
        ),
        centerTitle: true,
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(14.0),
        children: [
          Card(
            elevation: 3,
            child: Container(
              height: height * 0.2,
              width: double.infinity,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                      fit: BoxFit.fill, image: AssetImage(Assets.imagesBg)),
                  color: GameColor.white),
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Card(
            elevation: 3,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              height: height * 0.10,
              width: width * 0.99,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: GameColor.white),
              child: const Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Price",
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 15),
                        ),
                        Text('₹1000',
                            style: TextStyle(
                                color: GameColor.blue,
                                fontWeight: FontWeight.w700,
                                fontSize: 13)),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Daily income",
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 15),
                        ),
                        Text('₹100',
                            style: TextStyle(
                                color: GameColor.blue,
                                fontWeight: FontWeight.w700,
                                fontSize: 13)),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Total earning",
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 15),
                        ),
                        Text(
                          '₹100',
                          style: TextStyle(
                              color: GameColor.blue,
                              fontWeight: FontWeight.w700,
                              fontSize: 13),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.03,
          ),
          const Text(
            "Project description",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                color: GameColor.white,
                fontSize: 20),
          ),
          const SizedBox(
            height: 20,
          ),
          Card(
            elevation: 3,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              width: double.infinity,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: GameColor.white),
              child: const HtmlWidget(
                'It is very good product ',
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ConstantButton(
            onTap: () {},
            text: 'GET',
          )),
    ));
  }
}
