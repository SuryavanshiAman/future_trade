import 'package:flutter/material.dart';
import 'package:future_trade/generated/assets.dart';
import 'package:future_trade/helper/response/status.dart';
import 'package:future_trade/main.dart';
import 'package:future_trade/res/api_url.dart';
import 'package:future_trade/res/color-const.dart';
import 'package:future_trade/res/constantButton.dart';
import 'package:future_trade/res/constant_app_bar.dart';
import 'package:future_trade/view_model/my_product_view_model.dart';
import 'package:future_trade/view_model/reddem_view_model.dart';
import 'package:provider/provider.dart';

class MyProductScreen extends StatefulWidget {
  const MyProductScreen({super.key});

  @override
  State<MyProductScreen> createState() => _MyProductScreenState();
}

class _MyProductScreenState extends State<MyProductScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<MyProductViewModel>(context,listen: false).myProductApi(context);
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final redeem=Provider.of<RedeemViewModel>(context);
    // if (productData == null || productData.data == null) {
    //   return const Center(child: Center(child: CircularProgressIndicator(color: GameColor.white,)));
    // }
    // final product = productData.data;
    return Scaffold(
      backgroundColor: GameColor.black,
      appBar: const ConstantAppBar(
        title: Text(
          "My Project",
          style: TextStyle(color: GameColor.white, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body:
      Consumer<MyProductViewModel>(
        builder: (context, productData, _) {
          switch (
          productData.productList.status) {
            case Status.LOADING:
              return const Center(
                child: CircularProgressIndicator(color: GameColor.white,),
              );
            case Status.ERROR:
              return Container();
            case Status.COMPLETED:
              final product = productData.productList.data!.data;
              if (product != null && product.isNotEmpty) {
                return  ListView.builder(
                    itemCount:product.length,
                    padding: const EdgeInsets.all(8.0),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    // physics: const BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: GameColor.white))),
                        child: ListTile(
                          title: Text(product[index].productName.toString(),
                              style: const TextStyle(
                                  color: GameColor.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600)),
                          subtitle: Text("ROI:${product[index].roi.toString()}%",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: GameColor.white,
                                  fontSize: 14)),
                          trailing:  Text("Prize:₹${product[index].productPrice.toString()}",
                              style:  TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: GameColor.green,
                                  fontSize: 14)),
                        ),
                      );
                    });
              } else {
                return   Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: height*0.2,),
                    Center(child: Image.asset(Assets.imagesNoData,scale: 1,)),
                    SizedBox(height: height*0.01,),
                    const Text(
                      "No Product Found!",
                      style: TextStyle(color: GameColor.white, fontSize: 16),
                    ),

                  ],
                );
              }
            default:
              return Container();
          }
        },
      )

    );
  }
}
