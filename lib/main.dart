import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:future_trade/res/app_constant.dart';
import 'package:future_trade/utils/routes/routes.dart';
import 'package:future_trade/utils/routes/routes_name.dart';
import 'package:future_trade/view_model/add_bank_details_view_model.dart';
import 'package:future_trade/view_model/all_policies_view_model.dart';
import 'package:future_trade/view_model/auth_view_model.dart';
import 'package:future_trade/view_model/referral_list_view_model.dart';
import 'package:future_trade/view_model/update_image_view_model.dart';
import 'package:future_trade/view_model/withdraw_view_model.dart';
import 'package:provider/provider.dart';

import 'view_model/controller.dart';
import 'view_model/deposit_view_model.dart';
import 'view_model/downline_view_model.dart';
import 'view_model/join_view_model.dart';
import 'view_model/level_view_model.dart';
import 'view_model/my_product_view_model.dart';
import 'view_model/product_view_model.dart';
import 'view_model/profile_view_model.dart';
import 'view_model/reddem_view_model.dart';
import 'view_model/transaction_history_view_model.dart';
import 'view_model/user_view_model.dart';
import 'view_model/view_bank_details_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    height=MediaQuery.of(context).size.height;
    width=kIsWeb?400:MediaQuery.of(context).size.width;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ElementController()),
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => UserViewModel()),
        ChangeNotifierProvider(create: (_) => ProductViewModel()),
        ChangeNotifierProvider(create: (_) => AddBankDetailsViewModel()),
        ChangeNotifierProvider(create: (_) => ViewBankDetailViewModel()),
        ChangeNotifierProvider(create: (_) => ProfileViewModel()),
        ChangeNotifierProvider(create: (_) => JoinViewModel()),
        ChangeNotifierProvider(create: (_) => MyProductViewModel()),
        ChangeNotifierProvider(create: (_) => ReferralListViewModel()),
        ChangeNotifierProvider(create: (_) => AllPoliciesViewModel()),
        ChangeNotifierProvider(create: (_) => UpdateImageViewModel()),
        ChangeNotifierProvider(create: (_) => TransactionHistoryViewModel()),
        ChangeNotifierProvider(create: (_) => LevelViewModel()),
        ChangeNotifierProvider(create: (_) => RedeemViewModel()),
        ChangeNotifierProvider(create: (_) => WithdrawViewModel()),
        ChangeNotifierProvider(create: (_) => DepositViewModel()),
        ChangeNotifierProvider(create: (_) => DownlineViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppConstants.appName,
        initialRoute: RoutesName.splashScreen,
        onGenerateRoute: (settings) {
          if (settings.name != null) {
            return MaterialPageRoute(
              builder: Routers.generateRoute(settings.name!),
              settings: settings,
            );
          }
          return null;
        },
        // home: const MyTeam(),
      ),
    );
  }
}
double height=0.0;
double width=0.0;
