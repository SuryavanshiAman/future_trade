import 'package:flutter/foundation.dart';
import 'package:future_trade/model/my_product_model.dart';
import 'package:future_trade/res/api_url.dart';

import '../helper/network/base_api_services.dart';
import '../helper/network/network_api_services.dart';

class MyProductRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<MyProductModel> myProductApi(dynamic data) async {
    try {
      dynamic response =
      await _apiServices.getGetApiResponse("${ApiUrl.myProduct}$data");
      return MyProductModel.fromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during myProductApi: $e');
      }
      rethrow;
    }
  }
}