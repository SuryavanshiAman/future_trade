import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:future_trade/generated/assets.dart';
import 'package:future_trade/main.dart';
import 'package:future_trade/res/color-const.dart';
import 'package:future_trade/res/constant_app_bar.dart';
import 'package:future_trade/view_model/controller.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final element = Provider.of<ElementController>(context).elementList;
    return Scaffold(
      backgroundColor: GameColor.black,
      appBar: const ConstantAppBar(
        title: Text(
          "Profile",
          style: TextStyle(fontWeight: FontWeight.w600, color: GameColor.white),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            margin: const EdgeInsets.all(18),
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: GameColor.white,
              boxShadow: const [
                BoxShadow(
                  color: GameColor.bg, //New
                  blurRadius: 4,
                )
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: height * 0.1,
                  width: width * 0.32,
                  decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: GameColor.blue, //New
                          blurRadius: 10,
                        )
                      ],
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(
                              Assets.imagesUser))),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Text(
                  "Aman Chauhan",
                  style: TextStyle(
                      color: GameColor.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Login Id :",
                          style: TextStyle(
                              color: GameColor.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        ),
                        Text(
                          "Mobile No.:",
                          style: TextStyle(
                              color: GameColor.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        ),
                        Text(
                          "Wallet:",
                          style: TextStyle(
                              color: GameColor.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        ),
                      ],
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "1345",
                          style: TextStyle(
                              color: GameColor.purple,
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        ),
                        Text(
                          "1234567890",
                          style: TextStyle(
                              color: GameColor.purple,
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        ),
                        Text(
                          "123",
                          style: TextStyle(
                              color: GameColor.purple,
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 80,
              ),
              itemCount: element.length,
              itemBuilder: (BuildContext context, index) {
                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.all(18),
                  child: InkWell(
                    onTap: () {
                      if (element[index].onTap != null) {
                        element[index].onTap!(context);
                      }
                      // element[index].onTap;
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>myprojectview(view:snapshot.data![index])));
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: GameColor.bg, //New
                              blurRadius: 2,
                            )
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: GameColor.white),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image(image: AssetImage(element[index].image,),color: GameColor.blue,),
                            Text(
                              element[index].name,
                              style:  const TextStyle(
                                  color: GameColor.blue,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
