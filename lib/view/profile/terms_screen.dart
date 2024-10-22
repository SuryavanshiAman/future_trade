
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:future_trade/res/color-const.dart';
import 'package:future_trade/res/constant_app_bar.dart';


class TermsScreen extends StatefulWidget {
  const TermsScreen({super.key});

  @override
  State<TermsScreen> createState() => _TermsScreenState();
}

class _TermsScreenState extends State<TermsScreen> {

  // ApiController apiController = ApiController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Scaffold(
         appBar:  ConstantAppBar(
            leading: GestureDetector(
                onTap: (){Navigator.pop(context);},
                child: const Icon(Icons.arrow_back,color: GameColor.white,)),
            title: const Text(
              "Terms&Conditions",
              style: TextStyle(fontWeight: FontWeight.w600, color: GameColor.white),
            ),
            centerTitle: true,
          ),
          body:const SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: HtmlWidget(
                  "Terms & Condition"
                ),
              )),
        )
    );
  }
}
