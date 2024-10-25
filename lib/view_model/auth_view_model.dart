import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:future_trade/model/user_data_model.dart';
import 'package:future_trade/utils/routes/routes_name.dart';
import 'package:future_trade/utils/utils.dart';
import 'package:future_trade/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

import '../repo/auth_repo.dart';

class AuthViewModel with ChangeNotifier {
  final _authRepo = AuthRepository();

  bool _loading = false;

  bool get loading => _loading;
  UserDataModel? _userDataResponse;
  UserDataModel? get userDataResponse => _userDataResponse;
  setUserData(UserDataModel response) {
    _userDataResponse = response;
    notifyListeners();
  }
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> authApi(dynamic phone, context) async {
    final userPref = Provider.of<UserViewModel>(context, listen: false);
    setLoading(true);
    _authRepo.authApi(phone).then((value) {
      if (value['status'] == 200) {
        setLoading(false);
        userPref.saveUser(value['data']['id'].toString());
        print("aman");
        print(userPref.getUser());
        UserDataModel userDataModel = UserDataModel.fromJson(value);
        Provider.of<AuthViewModel>(context, listen: false).setUserData(userDataModel);
        Navigator.pushReplacementNamed(context, RoutesName.bottomNavBar);
      }
      else {
      setLoading(false);
      Utils.flushBarErrorMessage(value['msg'], context);
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        print('loginApiError: $error');
      }
    });
  }
  final _otpRepo = AuthRepository();



  Future<void> sedOtpApi(dynamic data, context) async {
    setLoading(true);
    _otpRepo.otpApi(data).then((value) {
      if (value['error'] == "200") {
        setLoading(false);
        Navigator.pushNamed(context, RoutesName.otpScreen,arguments: {
          "phone":data,
          "otp":value['otp']
        });
        Utils.flushBarSuccessMessage(
            value['msg'], context);
      } else {
        setLoading(false);
        Utils.flushBarErrorMessage(
            value['msg'], context);
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        print('otpError: $error');
      }
    });
  }

  Future<void> verifyOtpApi(dynamic phone,dynamic otp, context) async {
    // final userPref = Provider.of<UserViewModel>(context, listen: false);
    setLoading(true);
    // print(otp);
    _otpRepo.verifyOtpApi(phone,otp).then((value) {
      if (value['error'] == "200") {
        setLoading(false);
        authApi(phone,context);
        Utils.flushBarSuccessMessage(
            value['msg'], context);


      } else {
        setLoading(false);
        Utils.flushBarErrorMessage(
            value['msg'], context);
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        print('verifyError: $error');
      }
    });
  }


}