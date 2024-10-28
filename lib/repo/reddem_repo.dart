
import 'package:flutter/foundation.dart';
import 'package:future_trade/res/api_url.dart';
import '../helper/network/base_api_services.dart';
import '../helper/network/network_api_services.dart';

class RedeemRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> redeemApi(dynamic userID ,dynamic pID) async {
    try {
      dynamic response =
      await _apiServices.getGetApiResponse("${ApiUrl.redeem}$userID&project_id=$pID" );
      return response;
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during redeemApi: $e');
      }
      rethrow;
    }
  }}