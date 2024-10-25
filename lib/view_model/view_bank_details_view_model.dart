import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:future_trade/model/bank_model.dart';
import 'package:future_trade/repo/view_bank_details.dart';
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


  Future<void> viewBankDetailsApi(BuildContext context ) async {
    final userData= Provider.of<AuthViewModel>(context,listen: false).userDataResponse!.data;

    _viewBankDetailRepo.viewBankDetailsApi(userData!.userId).then((value) {
      if (value["status"] == 200) {
        BankModel bankDetailViewModel = BankModel.fromJson(value);
        Provider.of<ViewBankDetailViewModel>(context, listen: false)
            .setBankDetailsList(bankDetailViewModel);

      } else {
        if (kDebugMode) {
          print('value: ${value.message}');
        }
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print('error: $error');
      }
    });
  }
}
