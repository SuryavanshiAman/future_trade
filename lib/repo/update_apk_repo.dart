import 'package:flutter/foundation.dart';
import 'package:future_trade/res/api_url.dart';

import '../helper/network/base_api_services.dart';
import '../helper/network/network_api_services.dart';

class UpdateApkRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> updateApkApi() async {
    try {
      dynamic response =
      await _apiServices.getGetApiResponse(ApiUrl.autoUpdateApk);
      return response;
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during updateApkApi: $e');
      }
      rethrow;
    }
  }
}