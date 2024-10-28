import 'package:flutter/foundation.dart';
import 'package:future_trade/res/api_url.dart';

import '../helper/network/base_api_services.dart';
import '../helper/network/network_api_services.dart';
import '../model/transaction_history_model.dart';

class TransactionHistoryRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<TransactionHistoryModel> transactionHistoryApi(dynamic data) async {
    try {
      dynamic response =
      await _apiServices.getGetApiResponse("${ApiUrl.transactionHistory}$data");
      return TransactionHistoryModel.fromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during transactionHistoryApi: $e');
      }
      rethrow;
    }
  }
}