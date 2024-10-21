import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:future_trade/res/app_constant.dart';
import 'package:future_trade/utils/routes/routes.dart';
import 'package:future_trade/utils/routes/routes_name.dart';
import 'package:provider/provider.dart';

import 'view_model/controller.dart';

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
        // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
double height=0.0;
double width=0.0;
