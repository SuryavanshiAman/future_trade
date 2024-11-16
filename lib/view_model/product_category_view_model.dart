import 'package:flutter/foundation.dart';
import 'package:future_trade/model/product_catogies_model.dart';
import 'package:future_trade/repo/product_category_model.dart';
import '../helper/response/api_response.dart';

class ProductCategoryViewModel with ChangeNotifier {
  final _productCategoryRepo =ProductCategoryRepository();

  ApiResponse<ProductCategoryModel> productCategoryList = ApiResponse.loading();

  setProductCategoryList(ApiResponse<ProductCategoryModel> response) {
    productCategoryList = response;
    notifyListeners();
  }

  Future<void>productCategoryApi(context,) async {
    setProductCategoryList(ApiResponse.loading());
    _productCategoryRepo.productCategoryApi().then((value) {
      if (value.status == 200) {
        setProductCategoryList(ApiResponse.completed(value));
      } else {
        if (kDebugMode) {
          print('value:');
        }
      }
    }).onError((error, stackTrace) {
      setProductCategoryList(ApiResponse.error(error.toString()));
      if (kDebugMode) {
        print('error: $error');
      }
    });
  }
}
