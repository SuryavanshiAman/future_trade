import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:future_trade/generated/assets.dart';
import 'package:future_trade/res/launcher.dart';
import 'package:future_trade/utils/routes/routes_name.dart';
import 'package:future_trade/utils/utils.dart';
import 'package:future_trade/view_model/product_view_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ElementController with ChangeNotifier {

  int _selectedIndex=0;
  int get selectedIndex=>_selectedIndex;
  setSelectedIndex(int val){
    _selectedIndex=val;
    notifyListeners();
  }
  File? _image;
  File? get image => _image;
  File? _aadhaarImage;
  File? get aadhaarImage =>_aadhaarImage;
  File? _aadhaarBackImage;
  File? get aadhaarBackImage =>_aadhaarBackImage;
  File? _panImage;
  File? get panImage =>_panImage;
  final picker = ImagePicker();
  void setImage(File? value) {
    _image = value;
    notifyListeners();
  }
void setAadhaarImage(File?value){
  _aadhaarImage = value;
  notifyListeners();
}
  void setAadhaarBackImage(File?value){
    _aadhaarBackImage = value;
    notifyListeners();
  }
  void setPanImage(File?value){
    _panImage = value;
    notifyListeners();
  }
  String? base64Image;
  String? aadhaarBase64Image;
  String? aadhaarBackBase64Image;
  String? panBase64Image;
  Future<void> getImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
        _image = File(pickedFile.path);
      base64Image = base64Encode(_image!.readAsBytesSync());
        notifyListeners();
    }
  }
  Future<void> getAadhaarImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      _aadhaarImage = File(pickedFile.path);
      aadhaarBase64Image = base64Encode(_aadhaarImage!.readAsBytesSync());
      notifyListeners();
    }
  }
  Future<void> getAadhaarBackImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      _aadhaarBackImage = File(pickedFile.path);
      aadhaarBackBase64Image = base64Encode(_aadhaarBackImage!.readAsBytesSync());
      notifyListeners();
    }
  }
  Future<void> getPanImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      _panImage = File(pickedFile.path);
      panBase64Image = base64Encode(_panImage!.readAsBytesSync());
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
          Launcher.openTelegram();
        }),
    ElementModel(
        image: Assets.imagesTeam,
        name: 'Team',
        onTap: (context){
          Navigator.pushNamed(context, RoutesName.myTeam);
        }),
    ElementModel(
        image: Assets.imagesKyc,
        name: 'KYC',
        onTap: (context){
          Navigator.pushNamed(context, RoutesName.kycScreen);
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
          Utils.showLogOutConfirmation(context);
        }),


  ];
  List<ProductModel> productList = [
    ProductModel(
      name: 'USD',
      onTap: (context){
        Provider.of<ProductViewModel>(context,listen: false).productApi(context,"1");
      }, ),
    ProductModel(
        name: 'BitCoin',
        onTap: (context){
          Provider.of<ProductViewModel>(context,listen: false).productApi(context,"2");
        }),
    ProductModel(
        name: 'Nifty 50',
        onTap: (context){
          Provider.of<ProductViewModel>(context,listen: false).productApi(context,"3");
        }),
    ProductModel(
        name: 'Bank Nifty',
        onTap: (context){
          Provider.of<ProductViewModel>(context,listen: false).productApi(context,"4");
        }),

  ];
  List<dynamic> amount = [
    10000,
    25000,
    50000,
    100000,
    200000,
    500000
  ];
  final List<Map<String, dynamic>> paymentOptions = [
    {
      'title': 'Cash',
      'subtitle': 'Use Cash for payment',
      'image': Assets.imagesCash,
      'value': 'Cash',
    },
    {
      'title': 'Cheque',
      'subtitle': 'Upload Cheque for payment',
      'image': Assets.imagesCheque,
      'value': 'Cheque',
    },
    {
      'title': 'UPI',
      'subtitle': 'Use UPI for payment',
      'image': Assets.imagesUpi,
      'value': 'UPI',
    },
    {
      'title': 'Debit/NetBanking',
      'subtitle': 'Use Debit card or use NetBanking for payment',
      'image': Assets.imagesBanking,
      'value': 'NetBanking',  // Only "NetBanking" as the value
    },
  ];
  final List<Map<String, dynamic>> product = [
    {
      'title': 'Nifty50',
    },
    {
      'title': 'Bank Nifty',
    },
    {
      'title': 'USD',
    },
    {
      'title': 'Bitcoin',// Only "NetBanking" as the value
    },
  ];
  final List<Map<String, dynamic>> items = [
    {
      'title': 'Nifty50',
      'subtitle': '₹100',
    },
    {
      'title': 'Bank Nifty',
      'subtitle': '₹100',
    },
    {
      'title': 'USD',
      'subtitle': '₹100',
    },
    {
      'title': 'Bitcoin',
      'subtitle': '₹100',// Only "NetBanking" as the value
    },
  ];
  late List<bool> selectedItems ;
  ElementController() {
    selectedItems = List.generate(items.length, (_) => false);
    notifyListeners();
  }
  void toggleSelection(int index) {
    selectedItems[index] = !selectedItems[index];
    notifyListeners();  // Notify listeners to update UI
  }
}
class ElementModel{
  final String image;
  final String name;
  final Function(BuildContext)? onTap;
  ElementModel({required this.image,required this.name,required this.onTap,});

}
class ProductModel{
  final String name;
  final Function(BuildContext)? onTap;
  ProductModel({required this.name,required this.onTap});
}