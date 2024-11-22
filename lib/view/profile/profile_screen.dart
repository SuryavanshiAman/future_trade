import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:future_trade/main.dart';
import 'package:future_trade/res/api_url.dart';
import 'package:future_trade/res/circular_button.dart';
import 'package:future_trade/res/color-const.dart';
import 'package:future_trade/res/constantButton.dart';
import 'package:future_trade/res/constant_app_bar.dart';
import 'package:future_trade/view_model/all_policies_view_model.dart';
import 'package:future_trade/view_model/controller.dart';
import 'package:future_trade/view_model/profile_view_model.dart';
import 'package:future_trade/view_model/update_image_view_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProfileViewModel>(context, listen: false)
          .getProfileApi(context);
      Provider.of<AllPoliciesViewModel>(context,listen: false).allPoliciesApi(context);
    });

    super.initState();
  }
  File? image;
  final picker = ImagePicker();
  String? base64Image;
  Future<void> getImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
      base64Image = base64Encode(image!.readAsBytesSync());
    }
  }
  @override
  Widget build(BuildContext context) {
    final element = Provider.of<ElementController>(context).elementList;
    final user = Provider.of<ProfileViewModel>(context).profileResponse?.data;
    final img = Provider.of<UpdateImageViewModel>(context);
    final sendImg = Provider.of<ElementController>(context);
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
                Stack(
                  children: [
                    Container(
                      height: height * 0.12,
                      width: width * 0.32,
                      decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: GameColor.blue, //New
                              blurRadius: 10,
                            )
                          ],
                          shape: BoxShape.circle,
                      ),
                      child: CircleAvatar(
                        radius: 35,
                        backgroundImage: user?.photo!=null? NetworkImage(
                            "${ApiUrl.imageUrl}${user?.photo ?? ""}"):FileImage(image!),
                      ),
                    ),
                    Positioned(
                      top: height*0.065,
                        left: width*0.21,
                        child:  Container(
                         padding: const EdgeInsets.all(3),
                          decoration:  const BoxDecoration(
                            shape: BoxShape.circle,
                            color: GameColor.blue
                          ),
                          child: GestureDetector(
                          onTap: (){
                            _showPicker(context);
                          },
                          child: const Icon(Icons.camera_alt_outlined,color: GameColor.white,)),
                        ))

                  ],
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Text(
                  user?.name.toString() ?? "",
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          user?.userId ?? "",
                          style: const TextStyle(
                              color: GameColor.blue,
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        ),
                        Text(
                          user?.phone ?? "",
                          style: const TextStyle(
                              color: GameColor.blue,
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        ),
                        Text(
                          "₹${user?.wallet ?? " "}",
                          style: const TextStyle(
                              color: GameColor.blue,
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
            physics: const NeverScrollableScrollPhysics(),
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
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                          boxShadow: [
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
                            Image(
                              image: AssetImage(
                                element[index].image,
                              ),
                              color: GameColor.blue,
                            ),
                            Text(
                              element[index].name,
                              style: const TextStyle(
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
          img.loading==false? Center(
            child: ConstantButton(
              width: width*0.5,
                onTap: (){
                  img.updateImageApi(base64Image != null ? base64Image.toString() : "", context);
            }, text: "Update Image"),
          ):const CircularButton()
        ],
      ),
    );
  }
  void _showPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Gallery'),
                onTap: () {
                  getImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Camera'),
                onTap: () {
                 getImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
