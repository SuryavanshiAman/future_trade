import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:future_trade/generated/assets.dart';
import 'package:future_trade/res/launcher.dart';
import 'package:future_trade/utils/routes/routes_name.dart';
import 'package:future_trade/utils/utils.dart';
import 'package:image_picker/image_picker.dart';

class ElementController with ChangeNotifier{
  int _selectedIndex=0;
  int get selectedIndex=>_selectedIndex;
  setSelectedIndex(int val){
    _selectedIndex=val;
    notifyListeners();
  }
  File? _image;
  File? get image => _image;
  final picker = ImagePicker();
  void setImage(File value) {
    _image = value;
    notifyListeners();
  }

  String? base64Image;
  Future<void> getImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      // setState(() {
        _image = File(pickedFile.path);
      // });
      base64Image = base64Encode(_image!.readAsBytesSync());
        notifyListeners();
    }
  }
  List<ElementModel> elementList = [
    ElementModel(
      image:Assets.imagesBank,
      name: 'Bank Details',
      onTap: (context){
        Navigator.pushNamed(context, RoutesName.bankDetailsScreen);
      }, ),
    ElementModel(
        image:Assets.imagesSupport,
        name: 'Support',
        onTap: (context){
          Launcher.openTelegram("https://web.telegram.org/k/");
        }),
    ElementModel(
        image: Assets.imagesTeam,
        name: 'Team',
        onTap: (context){
          Navigator.pushNamed(context, RoutesName.myTeam);
        }),
    ElementModel(
        image:Assets.imagesAbout,
        name: 'About Us',
        onTap: (context){
          Navigator.pushNamed(context, RoutesName.aboutUsScreen);
        }),
    ElementModel(
        image: Assets.imagesPolicy,
        name: 'Privacy Policy  ',
        onTap: (context){
          Navigator.pushNamed(context, RoutesName.policyScreen);
        }),
    ElementModel(
        image: Assets.imagesTermCon,
        name: 'T&C',
        onTap: (context){
          Navigator.pushNamed(context, RoutesName.termsScreen);
        }),
    ElementModel(
        image:Assets.imagesLogOut,
        name: 'Logout',
        onTap: (context){
          Utils.showExitConfirmation(context);
        }),


  ];
  List<ProductModel> productList = [
    ProductModel(
      name: 'USD',
      onTap: (){
      }, ),
    ProductModel(
        name: 'BitCoin',
        onTap: (){
        }),
    ProductModel(
        name: 'Nifty 50',
        onTap: (){
        }),
    ProductModel(
        name: 'Bank Nifty',
        onTap: (){
        }),

  ];
}
class ElementModel{
  final String image;
  final String name;
  final Function(BuildContext)? onTap;
  ElementModel({required this.image,required this.name,required this.onTap,});

}
class ProductModel{
  final String name;
  final VoidCallback? onTap;
  ProductModel({required this.name,required this.onTap});
}