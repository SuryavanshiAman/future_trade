import 'package:flutter/foundation.dart';
import 'package:future_trade/res/api_url.dart';
import '../helper/network/base_api_services.dart';
import '../helper/network/network_api_services.dart';

class DownlineRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> downlineApi(dynamic userID) async {
    try {
      dynamic response = await _apiServices
          .getGetApiResponse(ApiUrl.downlineApi + userID);
      return response;
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during downlineApi: $e');
      }
      rethrow;
    }
  }
}