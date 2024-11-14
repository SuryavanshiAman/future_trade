import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:future_trade/model/kyc_model.dart';
import 'package:future_trade/repo/view_kyc_details_repo.dart';
import 'package:future_trade/view_model/user_view_model.dart';

class ViewKycDetailViewModel with ChangeNotifier {
  final _viewKycDetailRepo = ViewKycDetailsRepository();
  KycModel? _kycResponse;
  KycModel? get kycResponse => _kycResponse;

  setBankDetailsList(KycModel response) {
    _kycResponse = response;
    notifyListeners();
  }

  Future<void> viewKycDetailsApi(BuildContext context) async {
    UserViewModel userViewModel = UserViewModel();
    String? userId = await userViewModel.getUser();

    _viewKycDetailRepo.viewKycDetailsApi(userId).then((value) {
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
