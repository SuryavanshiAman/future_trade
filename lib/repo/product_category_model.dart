import 'package:flutter/foundation.dart';
import 'package:future_trade/model/product_catogies_model.dart';
import 'package:future_trade/model/product_model.dart';
import 'package:future_trade/res/api_url.dart';

import '../helper/network/base_api_services.dart';
import '../helper/network/network_api_services.dart';

class ProductCategoryRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<ProductCategoryModel> productCategoryApi() async {
    try {
      dynamic response =
      await _apiServices.getGetApiResponse(ApiUrl.productType);
      return ProductCategoryModel.fromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during productCategoryApi: $e');
      }
      rethrow;
    }
  }
}