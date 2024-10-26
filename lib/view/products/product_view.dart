
import 'package:future_trade/generated/assets.dart';
import 'package:future_trade/main.dart';
import 'package:future_trade/res/api_url.dart';
import 'package:future_trade/res/circular_button.dart';
import 'package:future_trade/res/color-const.dart';
import 'package:future_trade/res/constantButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:future_trade/res/constant_app_bar.dart';
import 'package:future_trade/view_model/join_view_model.dart';
import 'package:provider/provider.dart';

class ProductViewScreen extends StatefulWidget {
  const ProductViewScreen({super.key, required});

  @override
  State<ProductViewScreen> createState() => _ProductViewScreenState();
}

class _ProductViewScreenState extends State<ProductViewScreen> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> arguments =
    ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    String id = arguments["id"].toString();
    String name = arguments["name"].toString();
    final image= arguments["image"].toString();
    final price= arguments["price"].toString();
    final monthlyIncome=  arguments["monthlyIncome"].toString();
    final roi= arguments["roi"].toString();
    final description= arguments["description"].toString();
    final joinProduct=Provider.of<JoinViewModel>(context);
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
        title:  Text(
          name.toString(),
          style: const TextStyle(fontWeight: FontWeight.w600, color: GameColor.white),
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
              decoration:  BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                      fit: BoxFit.fill, image: NetworkImage("${ApiUrl.imageUrl}${image.toString()}")),
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
              child:  Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Price",
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 15),
                        ),
                        Text('₹${price.toString()}',
                            style: const TextStyle(
                                color: GameColor.blue,
                                fontWeight: FontWeight.w700,
                                fontSize: 13)),
                      ],
                    ),
                    Column(
                      children: [
                        const Text(
                          "Monthaly income",
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 15),
                        ),
                        Text('₹${monthlyIncome.toString()}',
                            style: const TextStyle(
                                color: GameColor.blue,
                                fontWeight: FontWeight.w700,
                                fontSize: 13)),
                      ],
                    ),
                    Column(
                      children: [
                        const Text(
                          "ROI",
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 15),
                        ),
                        Text(
                          '${roi.toString()}%',
                          style: const TextStyle(
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
              child:  HtmlWidget(
                description.toString(),
              ),
            ),
          )
        ],
      ),

      bottomNavigationBar:joinProduct.loading==false? Padding(
          padding:  const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ConstantButton(
            onTap: () {
              joinProduct.joinApi(id, context);
            },
            text: 'GET',
          )):const CircularButton(),
    ));
  }
}
