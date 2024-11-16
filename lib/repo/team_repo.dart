import 'package:flutter/foundation.dart';
import 'package:future_trade/model/team_model.dart';
import 'package:future_trade/res/api_url.dart';
import '../helper/network/base_api_services.dart';
import '../helper/network/network_api_services.dart';

class TeamRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<TeamModel> teamApi(dynamic data) async {
    try {
      dynamic response = await _apiServices
          .getGetApiResponse(ApiUrl.team+data);
      return TeamModel.fromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during teamApi: $e');
      }
      rethrow;
    }
  }
}