import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:future_trade/model/bank_model.dart';
import 'package:future_trade/repo/view_bank_details.dart';
import 'package:future_trade/view_model/user_view_model.dart';
import 'package:provider/provider.dart';
import 'auth_view_model.dart';

class ViewBankDetailViewModel with ChangeNotifier {
  final _viewBankDetailRepo = ViewBankDetailsRepository();
  BankModel? _bankDetailResponse;
  BankModel? get bankDetailResponse => _bankDetailResponse;

  setBankDetailsList(BankModel response) {
    _bankDetailResponse = response;
    notifyListeners();
  }

  Future<void> viewBankDetailsApi(BuildContext context) async {
    UserViewModel userViewModel = UserViewModel();
    String? userId = await userViewModel.getUser();

    _viewBankDetailRepo.viewBankDetailsApi(userId).then((value) {
      if (value.status == 200) {
        setBankDetailsList(value);
      } else {
        if (kDebugMode) {
          print('value: ${value.msg}');
        }
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print('error: $error');
      }
    });
  }
}
