import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:future_trade/repo/join_project.dart';
import 'package:future_trade/utils/routes/routes_name.dart';
import 'package:future_trade/utils/utils.dart';
import 'package:future_trade/view_model/user_view_model.dart';

class JoinViewModel with ChangeNotifier {
  final _joinRepo = JoinRepository();

  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> joinApi(dynamic pId, context) async {
    setLoading(true);
    UserViewModel userViewModel = UserViewModel();
    String? userId = await userViewModel.getUser();
    Map data={
      "user_id":userId,
      "project_id":pId
    };
    _joinRepo.joinApi(data).then((value) {
      if (value['status'] == 200) {
        setLoading(false);
        Navigator.pushReplacementNamed(context, RoutesName.bottomNavBar);
        Utils.flushBarSuccessMessage(value['msg'], context);
      }
      else {
        setLoading(false);
        Navigator.pushReplacementNamed(context, RoutesName.depositScreen);
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