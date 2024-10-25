import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:future_trade/model/product_model.dart';
import 'package:future_trade/repo/product_repo.dart';

import '../helper/response/api_response.dart';

class ProductViewModel with ChangeNotifier {
  final _productRepo =ProductRepository();

  ApiResponse<ProductModel> productList = ApiResponse.loading();

  setProductList(ApiResponse<ProductModel> response) {
    productList = response;
    notifyListeners();
  }

  Future<void>productApi(context, dynamic data ) async {

    setProductList(ApiResponse.loading());
    _productRepo.productApi(data).then((value) {
      if (value.status == 200) {
        setProductList(ApiResponse.completed(value));
      } else {
        if (kDebugMode) {
          print('value:');
        }
      }
    }).onError((error, stackTrace) {
      setProductList(ApiResponse.error(error.toString()));
      if (kDebugMode) {
        print('error: $error');
      }
    });
  }
}
