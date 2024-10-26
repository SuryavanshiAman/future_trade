
import 'package:flutter/foundation.dart';
import 'package:future_trade/res/api_url.dart';
import '../helper/network/base_api_services.dart';
import '../helper/network/network_api_services.dart';

class UpdateImageRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> updateImageApi(dynamic data) async {
    try {
      dynamic response =
      await _apiServices.getPostApiResponse(ApiUrl.updateImg,data );
      return response;
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during updateImageApi: $e');
      }
      rethrow;
    }
  }}