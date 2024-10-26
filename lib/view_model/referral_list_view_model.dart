import 'package:flutter/foundation.dart';
import 'package:future_trade/model/product_model.dart';
import 'package:future_trade/model/referral_list_model.dart';
import 'package:future_trade/repo/product_repo.dart';
import 'package:future_trade/repo/referal_list_repo.dart';
import 'package:future_trade/view_model/user_view_model.dart';

import '../helper/response/api_response.dart';

class ReferralListViewModel with ChangeNotifier {
  final _referralListRepo =ReferralListRepository();

  ApiResponse<ReferralListModel> referralList = ApiResponse.loading();

  setProductList(ApiResponse<ReferralListModel> response) {
    referralList = response;
    notifyListeners();
  }

  Future<void>referralListApi(context ) async {
    setProductList(ApiResponse.loading());
    UserViewModel userViewModel = UserViewModel();
    String? userId = await userViewModel.getUser();
    _referralListRepo.referralListApi(userId).then((value) {
      if (value.status == 200) {
        setProductList(ApiResponse.completed(value));
      } else {
        if (kDebugMode) {
          print('value:');
        }
      }
    }).onError((error, stackTrace) {
      setProductList(ApiResponse.error(error.toString()));
      if (kDebugMode) {
        print('error: $error');
      }
    });
  }
}
