import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:future_trade/model/team_model.dart';
import 'package:future_trade/repo/team_repo.dart';
import 'package:future_trade/view_model/user_view_model.dart';

class TeamViewModel with ChangeNotifier {
  final _teamRepo = TeamRepository();
  TeamModel? _teamResponse;
  TeamModel? get teamResponse => _teamResponse;

  setNote(TeamModel response) {
    _teamResponse = response;
    notifyListeners();
  }

  Future<void> teamApi(BuildContext context) async {
    UserViewModel userViewModel = UserViewModel();
    String? userId = await userViewModel.getUser();
    _teamRepo.teamApi(userId).then((value) {
      if (value.status == 200) {
        setNote(value);
      } else {
        if (kDebugMode) {
          print('value: ${value.msg}');
        }
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print('error: $error');
      }
    });
  }
}
