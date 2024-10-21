import 'package:flutter/material.dart';
import 'package:future_trade/main.dart';
import 'package:future_trade/res/color-const.dart';
import 'package:future_trade/res/constantButton.dart';
import 'package:future_trade/res/constant_app_bar.dart';

class MyProductScreen extends StatefulWidget {
  const MyProductScreen({super.key});

  @override
  State<MyProductScreen> createState() => _MyProductScreenState();
}

class _MyProductScreenState extends State<MyProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GameColor.black,
      appBar: const ConstantAppBar(
        title: Text("My Project",style: TextStyle(color: GameColor.white,fontWeight: FontWeight.w600),),
        centerTitle: true,
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 380,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4),
          itemCount: 6,
          itemBuilder: (BuildContext ctx, index) {
            return Card(
              elevation: 3,
              child: InkWell(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>myprojectview(view:snapshot.data![index])));
                },
                child: Container(
                  decoration:  const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: GameColor.white),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: height * 0.20,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage("assets/images/bg.png"))),
                        ),
                        Text(
                          'USD',
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
                            children: <TextSpan>[
                              TextSpan(
                                  text: '₹1200',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: GameColor.purple,
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
                            children: <TextSpan>[
                              TextSpan(
                                  text: '₹1300',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: GameColor.purple,
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
                            children: <TextSpan>[
                              TextSpan(
                                  text: '₹1400',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: GameColor.purple,
                                      fontSize: 16)),
                            ],
                          ),
                        ),

                        const Spacer(),
                        // snapshot.data![index].status == "1"?
                      ConstantButton(
                                onTap: () {

                                },
                                text: 'REDEEM',
                              )
                            // : disablebutton(
                            //     onTap: () {},
                            //     text: 'Redeem',
                            //   )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
