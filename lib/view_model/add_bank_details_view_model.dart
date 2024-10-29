import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:future_trade/repo/add_bank_details_repo.dart';
import 'package:future_trade/utils/routes/routes_name.dart';
import 'package:future_trade/utils/utils.dart';
import 'package:future_trade/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

import 'user_view_model.dart';
import 'view_bank_details_view_model.dart';


class AddBankDetailsViewModel with ChangeNotifier {
  final _addBankDetailsRepo = AddBankDetailsRepository();

  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> addBankDetailsApi(
      dynamic name, dynamic accountNo, dynamic bankName,dynamic branchName,dynamic ifsc ,context) async {
    setLoading(true);
    UserViewModel userViewModel = UserViewModel();
    String? userId = await userViewModel.getUser();
    Map data = {
      "user_id":userId,
      "account_holder": name,
      "account_no": accountNo,
      "bank_name": bankName,
      "branch_name": branchName,
      "ifsc_code": ifsc
    };
    _addBankDetailsRepo.addBankDetailsApi(data).then((value) {

      if (value['status'] == 200) {
        setLoading(false);
        Provider.of<ViewBankDetailViewModel>(context,listen: false).viewBankDetailsApi(context);
        Navigator.pushReplacementNamed(context, RoutesName.bottomNavBar, arguments: {"index": 0});
        Utils.flushBarSuccessMessage(value['msg'],context,);
      } else {
        setLoading(false);

        Utils.flushBarErrorMessage(value['msg'],context);
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        print('error: $error');
      }
    });
  }
}
