import 'package:flutter/foundation.dart';
import 'package:future_trade/helper/network/base_api_services.dart';
import 'package:future_trade/helper/network/network_api_services.dart';
import 'package:future_trade/model/slider_model.dart';
import 'package:future_trade/res/api_url.dart';

class BannerRepository {
  final BaseApiServices _apiServices = NetworkApiServices();
  Future<BannerModel> bannerApi() async {
    try {
      dynamic response =
      await _apiServices.getGetApiResponse(ApiUrl.banner);
      return BannerModel.fromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during bannerApi: $e');
      }
      rethrow;
    }
  }
}