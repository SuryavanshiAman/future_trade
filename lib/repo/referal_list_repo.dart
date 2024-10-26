import 'package:flutter/foundation.dart';
import 'package:future_trade/model/referral_list_model.dart';
import 'package:future_trade/res/api_url.dart';

import '../helper/network/base_api_services.dart';
import '../helper/network/network_api_services.dart';

class ReferralListRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<ReferralListModel> referralListApi(dynamic data) async {
    try {
      dynamic response =
      await _apiServices.getGetApiResponse("${ApiUrl.referHistory}$data");
      return ReferralListModel.fromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during referralListApi: $e');
      }
      rethrow;
    }
  }
}