import 'package:flutter/foundation.dart';
import 'package:future_trade/model/my_product_model.dart';
import 'package:future_trade/repo/my_product_repo.dart';
import 'package:future_trade/view_model/user_view_model.dart';
import '../helper/response/api_response.dart';

class MyProductViewModel with ChangeNotifier {
  final _myProductRepo =MyProductRepository();

  ApiResponse<MyProductModel> productList = ApiResponse.loading();

  setProductList(ApiResponse<MyProductModel> response) {
    productList = response;
    notifyListeners();
  }

  Future<void>myProductApi(context ) async {
    setProductList(ApiResponse.loading());
    UserViewModel userViewModel = UserViewModel();
    String? userId = await userViewModel.getUser();
    _myProductRepo.myProductApi(userId).then((value) {
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
