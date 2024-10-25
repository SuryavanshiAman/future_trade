import 'package:flutter/foundation.dart';
import 'package:future_trade/res/api_url.dart';
import '../helper/network/base_api_services.dart';
import '../helper/network/network_api_services.dart';

class AddBankDetailsRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> addBankDetailsApi(dynamic data) async {
    try {
      dynamic response =
      await _apiServices.getPostApiResponse(ApiUrl.addBank, data);
      return response;
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during addBankDetailsApi: $e');
      }
      rethrow;
    }
  }
}