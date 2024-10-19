import 'package:flutter/material.dart';

class ElementController with ChangeNotifier{
  List<ElementModel> elementList = [
    ElementModel(
      image: "assets/dragon_and_tiger.gif",
      name: 'Active Downline',
      onTap: (){
      }, ),
    ElementModel(
        image: "assets/home_colour_prediction.webp",
        name: 'Cashback Income',
        onTap: (){
        }),
    ElementModel(
        image: "assets/home_colour_prediction.webp",
        name: 'Team Income',
        onTap: (){
        }),
    ElementModel(
        image: "assets/home_colour_prediction.webp",
        name: 'Total Income',
        onTap: (){
        }),
    ElementModel(
        image: "assets/home_colour_prediction.webp",
        name: 'Daily Income',
        onTap: (){
        }),
    ElementModel(
        image: "assets/home_colour_prediction.webp",
        name: 'Total Payout',
        onTap: (){
        }),
    ElementModel(
        image: 'assets/home_colour_prediction.webp',
        name: 'Today Team Business',
        onTap: (){
        }),

  ];
}
class ElementModel{
  final String image;
  final String name;
  final VoidCallback? onTap;
  ElementModel({required this.image,required this.name,required this.onTap,});

}