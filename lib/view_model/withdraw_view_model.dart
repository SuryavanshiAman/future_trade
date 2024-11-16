import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:future_trade/repo/withdraw_repo.dart';
import 'package:future_trade/utils/routes/routes_name.dart';
import 'package:future_trade/utils/utils.dart';
import 'package:future_trade/view_model/controller.dart';
import 'package:future_trade/view_model/profile_view_model.dart';
import 'package:future_trade/view_model/user_view_model.dart';
import 'package:provider/provider.dart';


class WithdrawViewModel with ChangeNotifier {
  final _withdrawRepo = WithdrawRepository();

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  ProfileViewModel profileViewModel = ProfileViewModel();

  Future<void> withdrawApi(dynamic amount,dynamic password,context) async {
    setLoading(true);

    UserViewModel userViewModel = UserViewModel();
    String? userId = await userViewModel.getUser();
    final type= Provider.of<ElementController>(context,listen: false);
    _withdrawRepo.withdrawApi(userId,amount,password,type.type).then((value) {
      if (value['status'] ==200) {
        setLoading(false);
        profileViewModel.getProfileApi(context);
        Navigator.pushReplacementNamed(context, RoutesName.bottomNavBar);
        Utils.flushBarSuccessMessage(value['msg'], context);
      }
      else{
        setLoading(false);
        Utils.flushBarErrorMessage(value['msg'], context);
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        print('error: $error');
      }
    });
  }

}