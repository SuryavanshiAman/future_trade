import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:future_trade/model/all_policies_model.dart';
import 'package:future_trade/repo/all_policies_repo.dart';
import 'package:provider/provider.dart';

class AllPoliciesViewModel with ChangeNotifier {
  final _allPoliciesRepo = AllPoliciesRepository();
  AllPoliciesModel? _policiesResponse;
  AllPoliciesModel? get policiesResponse => _policiesResponse;
  setAllPoliciesData(AllPoliciesModel response) {
    _policiesResponse = response;
    notifyListeners();
  }

  Future<void> allPoliciesApi(BuildContext context) async {
    _allPoliciesRepo.allPoliciesApi().then((value) {
      if (value['status'] == 200) {
        AllPoliciesModel allPoliciesModel = AllPoliciesModel.fromJson(value);
        Provider.of<AllPoliciesViewModel>(context, listen: false).setAllPoliciesData(allPoliciesModel);
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
