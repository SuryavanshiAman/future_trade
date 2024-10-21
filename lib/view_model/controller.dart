import 'package:flutter/material.dart';
import 'package:future_trade/res/launcher.dart';
import 'package:future_trade/utils/routes/routes_name.dart';
import 'package:future_trade/utils/utils.dart';

class ElementController with ChangeNotifier{
  int _selectedIndex=0;
  int get selectedIndex=>_selectedIndex;
  setSelectedIndex(int val){
    _selectedIndex=val;
    notifyListeners();
  }
  List<ElementModel> elementList = [
    ElementModel(
      image: "assets/images/bank.png",
      name: 'Bank Details',
      onTap: (context){
        Navigator.pushNamed(context, RoutesName.bankDetailsScreen);
      }, ),
    ElementModel(
        image: "assets/images/support.png",
        name: 'Support',
        onTap: (context){
          Launcher.openTelegram("https://web.telegram.org/k/");
        }),
    ElementModel(
        image: 'assets/images/team.png',
        name: 'Team',
        onTap: (context){
        }),
    ElementModel(
        image: "assets/images/about.png",
        name: 'About Us',
        onTap: (context){
        }),
    ElementModel(
        image: "assets/images/policy.png",
        name: 'Privacy Policy  ',
        onTap: (context){
        }),
    ElementModel(
        image: "assets/images/term_con.png",
        name: 'T&C',
        onTap: (context){
        }),
    ElementModel(
        image: "assets/images/log_out.png",
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