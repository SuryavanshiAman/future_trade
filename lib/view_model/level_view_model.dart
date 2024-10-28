import 'package:flutter/foundation.dart';
import 'package:future_trade/model/level_model.dart';
import 'package:future_trade/repo/level_repo.dart';
import 'package:future_trade/view_model/user_view_model.dart';
import '../helper/response/api_response.dart';

class LevelViewModel with ChangeNotifier {
  final _levelRepo =LevelRepository();

  ApiResponse<LevelModel> levelList = ApiResponse.loading();

  setLevelList(ApiResponse<LevelModel> response) {
    levelList = response;
    notifyListeners();
  }

  Future<void>levelApi(context,dynamic type ) async {
    setLevelList(ApiResponse.loading());
    UserViewModel userViewModel = UserViewModel();
    String? userId = await userViewModel.getUser();
    _levelRepo.levelApi(userId,type).then((value) {
      if (value.status == 200) {
        setLevelList(ApiResponse.completed(value));
      } else {
        if (kDebugMode) {
          print('value:');
        }
      }
    }).onError((error, stackTrace) {
      setLevelList(ApiResponse.error(error.toString()));
      if (kDebugMode) {
        print('error: $error');
      }
    });
  }
}
