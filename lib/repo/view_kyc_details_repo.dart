import 'package:flutter/foundation.dart';
import 'package:future_trade/model/kyc_model.dart';
import 'package:future_trade/res/api_url.dart';
import '../helper/network/base_api_services.dart';
import '../helper/network/network_api_services.dart';

class ViewKycDetailsRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<KycModel> viewKycDetailsApi(dynamic data) async {
    try {
      dynamic response = await _apiServices
          .getGetApiResponse("${ApiUrl.viewKyc}$data");
      return KycModel.fromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during viewKycDetailsApi: $e');
      }
      rethrow;
    }
  }
}