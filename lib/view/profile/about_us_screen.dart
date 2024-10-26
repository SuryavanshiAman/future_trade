
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:future_trade/res/color-const.dart';
import 'package:future_trade/res/constant_app_bar.dart';
import 'package:future_trade/view_model/all_policies_view_model.dart';
import 'package:provider/provider.dart';


class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final policies= Provider.of<AllPoliciesViewModel>(context).policiesResponse?.data;
    return SafeArea(
        child:Scaffold(
          appBar:  ConstantAppBar(
            leading: GestureDetector(
                onTap: (){Navigator.pop(context);},
                child: const Icon(Icons.arrow_back,color: GameColor.white,)),
            title: const Text(
              "About US",
              style: TextStyle(fontWeight: FontWeight.w600, color: GameColor.white),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: HtmlWidget(
                    policies?.aboutUs.toString()??""
                ),
              )),
        )
    );
  }
}
