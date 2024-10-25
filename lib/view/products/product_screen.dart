import 'package:flutter/material.dart';
import 'package:future_trade/generated/assets.dart';
import 'package:future_trade/main.dart';
import 'package:future_trade/res/color-const.dart';
import 'package:future_trade/res/constantButton.dart';
import 'package:future_trade/utils/routes/routes_name.dart';
import 'package:future_trade/view_model/product_view_model.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    final productData=Provider.of<ProductViewModel>(context).productList.data;

    if (productData == null || productData.data == null) {
      return const Center(child: Center(child: CircularProgressIndicator(color: GameColor.white,)));
    }
    final product = productData.data;
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 405,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4),
            itemCount: product!.length,
            itemBuilder: (BuildContext ctx, index) {
              if (product.isNotEmpty) {
                return Card(
                elevation: 3,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  height: height * 0.3,
                  width: width * 0.8,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: GameColor.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: height * 0.2,
                        decoration:  BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(product[index].productImg.toString()))),
                      ),
                      Text(
                        product[index].productName.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: GameColor.black,
                            fontSize: 20),
                        maxLines: 2,
                      ),
                      Text(
                        'Product price: ',
                        style: TextStyle(
                          color: GameColor.gray,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 2,
                      ),
                       Text(
                        '₹${product[index].productPrice.toString()}',
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: GameColor.blue,
                            fontSize: 16),
                        maxLines: 2,
                      ),
                      Text(
                        'Monthly income: ',
                        style: TextStyle(
                          color: GameColor.gray,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 2,
                      ),
                       Text(
                        '₹${product[index].monthlyIncome.toString()}',
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: GameColor.blue,
                            fontSize: 16),
                        maxLines: 2,
                      ),

                      Text(
                        'ROI: ',
                        style: TextStyle(
                          color: GameColor.gray,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 2,
                      ),
                       Text(
                        '${product[index].roi.toString()}%',
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: GameColor.blue,
                            fontSize: 16),
                        maxLines: 2,
                      ),
                      const Spacer(),
                      ConstantButton(
                        btnColor: GameColor.green,
                        onTap: () {
                          Navigator.pushNamed(
                              context, RoutesName.productViewScreen);
                        },
                        text: 'Join Project',
                      )
                    ],
                  ),
                ),
              );
              } else {
                return const CircularProgressIndicator();
              }
            }));
  }
}
