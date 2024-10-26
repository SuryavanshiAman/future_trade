import 'package:flutter/foundation.dart';
import 'package:future_trade/res/api_url.dart';
import '../helper/network/base_api_services.dart';
import '../helper/network/network_api_services.dart';

class AllPoliciesRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> allPoliciesApi() async {
    try {
      dynamic response = await _apiServices
          .getGetApiResponse(ApiUrl.term);
      return response;
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during allPoliciesApi: $e');
      }
      rethrow;
    }
  }
}