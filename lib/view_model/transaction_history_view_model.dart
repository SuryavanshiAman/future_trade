import 'package:flutter/foundation.dart';
import 'package:future_trade/model/transaction_history_model.dart';
import 'package:future_trade/repo/transaction_history_repo.dart';
import 'package:future_trade/view_model/user_view_model.dart';

import '../helper/response/api_response.dart';

class TransactionHistoryViewModel with ChangeNotifier {
  final _transactionRepo =TransactionHistoryRepository();

  ApiResponse<TransactionHistoryModel> transactionList = ApiResponse.loading();

  setTransaction(ApiResponse<TransactionHistoryModel> response) {
    transactionList = response;
    notifyListeners();
  }

  Future<void>transactionHistoryApi(context ) async {
    setTransaction(ApiResponse.loading());
    UserViewModel userViewModel = UserViewModel();
    String? userId = await userViewModel.getUser();
    _transactionRepo.transactionHistoryApi(userId).then((value) {
      if (value.status == 200) {
        setTransaction(ApiResponse.completed(value));
      } else {
        if (kDebugMode) {
          print('value:');
        }
      }
    }).onError((error, stackTrace) {
      setTransaction(ApiResponse.error(error.toString()));
      if (kDebugMode) {
        print('error: $error');
      }
    });
  }
}
