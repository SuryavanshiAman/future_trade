import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:future_trade/repo/update_image_repo.dart';
import 'package:future_trade/utils/routes/routes_name.dart';
import 'package:future_trade/utils/utils.dart';
import 'package:future_trade/view_model/user_view_model.dart';

class UpdateImageViewModel with ChangeNotifier {
  final _updateRepo = UpdateImageRepository();

  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> updateImageApi(dynamic img, context) async {
    setLoading(true);
    UserViewModel userViewModel = UserViewModel();
    String? userId = await userViewModel.getUser();
    Map data={
      "user_id":userId,
      "img":img
    };
    _updateRepo.updateImageApi(data).then((value) {
      if (value['status'] == 200) {
        setLoading(false);
        Navigator.pushReplacementNamed(context, RoutesName.bottomNavBar);
        Utils.flushBarSuccessMessage(value['msg'], context);
      }
      else {
        setLoading(false);
        Utils.flushBarErrorMessage(value['msg'], context);
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        print('joinApiError: $error');
      }
    });
  }
}