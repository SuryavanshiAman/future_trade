import 'package:flutter/foundation.dart';
import 'package:future_trade/model/product_model.dart';
import 'package:future_trade/res/api_url.dart';

import '../helper/network/base_api_services.dart';
import '../helper/network/network_api_services.dart';

class ProductRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<ProductModel> productApi(dynamic data) async {
    try {
      dynamic response =
      await _apiServices.getGetApiResponse("${ApiUrl.product}$data");
      return ProductModel.fromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during productApi: $e');
      }
      rethrow;
    }
  }
}