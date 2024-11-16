import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:future_trade/repo/add_kyc_repo.dart';
import 'package:future_trade/repo/join_project.dart';
import 'package:future_trade/utils/routes/routes_name.dart';
import 'package:future_trade/utils/utils.dart';
import 'package:future_trade/view_model/user_view_model.dart';

class AddKycViewModel with ChangeNotifier {
  final _addKycRepo = AddKycRepository();

  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> addKycApi(dynamic data, context) async {
    setLoading(true);

    _addKycRepo.addKycApi(data).then((value) {
      if (value['status'] == 200) {
        setLoading(false);
        Navigator.pushReplacementNamed(context, RoutesName.bottomNavBar);
        Utils.flushBarSuccessMessage(value['msg'], context);
      }
      else {
        setLoading(false);
        Utils.flushBarErrorMessage(value['msg'], context);
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        print('addKycApi: $error');
      }
    });
  }
}