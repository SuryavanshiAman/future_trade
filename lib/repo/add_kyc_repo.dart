
import 'package:flutter/foundation.dart';
import 'package:future_trade/res/api_url.dart';
import '../helper/network/base_api_services.dart';
import '../helper/network/network_api_services.dart';

class AddKycRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> addKycApi(dynamic data) async {
    try {
      dynamic response =
      await _apiServices.getPostApiResponse(ApiUrl.addKyc,data );
      return response;
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during addKycApi: $e');
      }
      rethrow;
    }
  }}