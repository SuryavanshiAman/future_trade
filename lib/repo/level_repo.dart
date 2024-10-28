import 'package:flutter/foundation.dart';
import 'package:future_trade/model/level_model.dart';
import 'package:future_trade/res/api_url.dart';

import '../helper/network/base_api_services.dart';
import '../helper/network/network_api_services.dart';

class LevelRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<LevelModel> levelApi(dynamic data, dynamic type) async {
    try {
      dynamic response =
      await _apiServices.getGetApiResponse("${ApiUrl.teamLevel}$data&type=$type");
      return LevelModel.fromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during levelApi: $e');
      }
      rethrow;
    }
  }
}