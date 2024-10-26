import 'package:flutter/material.dart';
import 'package:future_trade/helper/response/status.dart';
import 'package:future_trade/main.dart';
import 'package:future_trade/res/api_url.dart';
import 'package:future_trade/res/color-const.dart';
import 'package:future_trade/res/constantButton.dart';
import 'package:future_trade/res/constant_app_bar.dart';
import 'package:future_trade/view_model/my_product_view_model.dart';
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
    // final productData=Provider.of<MyProductViewModel>(context).productList.data;
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
      body: Consumer<MyProductViewModel>(
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
                return GridView.builder(
                    gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        // mainAxisExtent: 380,
                        mainAxisExtent: height*0.42,
                        crossAxisSpacing: 4,
                        mainAxisSpacing: 4),
                    itemCount: product.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return Card(
                        elevation: 3,
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: GameColor.white),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: height * 0.20,
                                width: double.infinity,
                                decoration:  BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage("${ApiUrl.imageUrl}${product[index].productImg.toString()}"))),
                              ),
                              Text(
                                product[index].productName.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: GameColor.black,
                                    fontSize: 20),
                                maxLines: 2,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: 'Product price: ',
                                  style: TextStyle(
                                    color: GameColor.gray,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  children:  <TextSpan>[
                                    TextSpan(
                                        text: '₹${product[index].productPrice.toString()}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: GameColor.blue,
                                            fontSize: 16)),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: 'Monthly income: ',
                                  style: TextStyle(
                                    color: GameColor.gray,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  children:  <TextSpan>[
                                    TextSpan(
                                        text: '₹${product[index].monthlyIncome.toString()}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: GameColor.blue,
                                            fontSize: 16)),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              RichText(
                                text: TextSpan(
                                  text: 'ROI: ',
                                  style: TextStyle(
                                    color: GameColor.gray,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  children:  <TextSpan>[
                                    TextSpan(
                                        text: '₹${product[index].roi.toString()}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: GameColor.blue,
                                            fontSize: 16)),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              ConstantButton(
                                onTap: () {},
                                text: 'REDEEM',
                              )
                            ],
                          ),
                        ),
                      );
                    });
              } else {
                return  const Center(
                  child: Text(
                    "No Product Found!",
                    style: TextStyle(
                        color: GameColor.white, fontSize: 16),
                  ),
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
