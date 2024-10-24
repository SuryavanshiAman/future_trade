import 'package:flutter/material.dart';
import 'package:future_trade/generated/assets.dart';
import 'package:future_trade/res/color-const.dart';
import 'package:future_trade/res/constantButton.dart';
import 'package:future_trade/utils/routes/routes_name.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

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
            itemCount: 6,
            itemBuilder: (BuildContext ctx, index) {
              return Card(
                elevation: 3,
                child: Container(
                  height: height * 0.3,
                  width: width * 0.8,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: GameColor.white),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: height * 0.2,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                      Assets.imagesPic))),
                        ),

                        Text(
                          'Usd',
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
                        const Text(
                          '₹4000',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: GameColor.purple,
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
                        const Text(
                          '₹1200',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: GameColor.purple,
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
                        const Text(
                          '8%',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: GameColor.purple,
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
                ),
              );
            }));
  }
}
