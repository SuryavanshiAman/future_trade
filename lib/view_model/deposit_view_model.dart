import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:future_trade/repo/deposit_repo.dart';
import 'package:future_trade/res/launcher.dart';
import 'package:future_trade/utils/routes/routes_name.dart';
import 'package:future_trade/utils/utils.dart';
import 'package:future_trade/view_model/controller.dart';
import 'package:future_trade/view_model/user_view_model.dart';
import 'package:provider/provider.dart';


class DepositViewModel with ChangeNotifier {
  final _depositRepo = DepositRepository();

  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> depositApi(dynamic amount,dynamic type,dynamic img,context) async {
    final selectImage = Provider.of<ElementController>(context,listen: false);

    setLoading(true);
    UserViewModel userViewModel = UserViewModel();
    String? userId = await userViewModel.getUser();
    print(userId);
    print("userId");
    Map data={
      "user_id":userId,
      "amount":amount,
      "type":type,
      "img":img
    };
    _depositRepo.depositApi(data).then((value) {
      if (value['status'] == 'SUCCESS') {
        setLoading(false);
        final url =value['payment_link'].toString();
        print("DepositURl:$url");
        Launcher.launchURL(url);
      } else if (value['status'] == 200){
        setLoading(false);
        Navigator.pushReplacementNamed(context, RoutesName.bottomNavBar);
        Utils.flushBarSuccessMessage(value['msg'],context);
        selectImage.setImage(null);
      }
      else {
        setLoading(false);
        Utils.flushBarErrorMessage(value['msg'],context);
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        print('error: $error');
      }
    });
  }
}