import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:future_trade/model/downline_model.dart';
import 'package:future_trade/repo/downline_repo.dart';
import 'package:future_trade/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';
import '../model/profile_model.dart';
import '../repo/profile_repo.dart';
import 'user_view_model.dart';

class DownlineViewModel with ChangeNotifier {
  final _downlineRepo = DownlineRepository();
  DownlineModel? _downlineResponse;
  DownlineModel? get downlineResponse => _downlineResponse;
  setDownlineData(DownlineModel response) {
    _downlineResponse = response;
    notifyListeners();
  }

  Future<void> downlineApi(BuildContext context) async {

    UserViewModel userViewModel = UserViewModel();
    String? userId = await userViewModel.getUser();
    _downlineRepo.downlineApi(userId).then((value) {
      if (value['status'] == 200) {
        DownlineModel downlineModel = DownlineModel.fromJson(value);
        Provider.of<DownlineViewModel>(context, listen: false).setDownlineData(downlineModel);
      } else {
        if (kDebugMode) {
          print('value: ${value['msg']}');
        }
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print('error: $error');
      }
    });
  }
}
