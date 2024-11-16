import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:future_trade/generated/assets.dart';
import 'package:future_trade/main.dart';
import 'package:future_trade/model/team_model.dart';
import 'package:future_trade/res/api_url.dart';
import 'package:future_trade/res/color-const.dart';
import 'package:future_trade/res/constant_app_bar.dart';
import 'package:future_trade/view_model/profile_view_model.dart';
import 'package:future_trade/view_model/team_view_model.dart';
import 'package:provider/provider.dart';

class MyTeam extends StatefulWidget {
  const MyTeam({super.key});

  @override
  State<MyTeam> createState() => _MyTeamState();
}

class _MyTeamState extends State<MyTeam> with TickerProviderStateMixin {
  @override
  void initState() {
    Provider.of<TeamViewModel>(context,listen: false).teamApi(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final team = Provider.of<TeamViewModel>(context).teamResponse?.data;
    return SafeArea(
        child: Scaffold(
      backgroundColor: GameColor.black,
      appBar: ConstantAppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: GameColor.white,
            )),
        title: const Text(
          "My Team",
          style: TextStyle(fontWeight: FontWeight.w600, color: GameColor.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: HtmlWidget(
               team?.data??""
            ),
          )),
      // Column(
      //   children: [
      //     SizedBox(height: height*0.16,),
      //      CircleAvatar(
      //       radius: 40,
      //       backgroundImage: NetworkImage( "${ApiUrl.imageUrl}${user?.photo.toString() ?? ""}"),
      //     ),
      //     Container(
      //       height: height*0.07,
      //       color: GameColor.white,
      //       width: width*0.01,
      //     ),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             Container(
      //               height: 5,
      //               color: GameColor.white,
      //               width: width*0.3,
      //             ),
      //             Container(
      //               height: height*0.07,
      //               color: GameColor.white,
      //               width: width*0.01,
      //             ),
      //
      //           ],
      //         ),
      //         Column(
      //           crossAxisAlignment: CrossAxisAlignment.end,
      //           children: [
      //             Container(
      //               height: 5,
      //               color: GameColor.white,
      //               width: width*0.3,
      //             ),
      //             Container(
      //               height: height*0.07,
      //               color: GameColor.white,
      //               width: width*0.01,
      //             ),
      //
      //           ],
      //         ),
      //       ],
      //     ),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //       children: [
      //          CircleAvatar(
      //           radius: 40,
      //           backgroundImage: AssetImage(Assets.imagesUser),
      //         ),
      //         SizedBox(width: width*0.2,),
      //         const CircleAvatar(
      //           radius: 40,
      //           backgroundImage: AssetImage(Assets.imagesUser),
      //         ),
      //       ],
      //     ),
      //     SizedBox(height: height*0.02,),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //       children: [
      //        Column(
      //          crossAxisAlignment: CrossAxisAlignment.start,
      //          children: [
      //            RichText(
      //              textAlign: TextAlign.center,
      //              text: const TextSpan(
      //                style: TextStyle(
      //                    fontSize: 16, color: Colors.white),
      //                children: [
      //                  TextSpan(
      //                      text: "Level:    ",
      //                      style: TextStyle(color: GameColor.white)),
      //                  TextSpan(
      //                    text: 'B',
      //                    style: TextStyle(
      //                      color: GameColor.white,
      //                      fontWeight: FontWeight.w600,
      //                    ),
      //                  ),
      //                ],
      //              ),
      //            ),
      //            RichText(
      //              textAlign: TextAlign.center,
      //              text: const TextSpan(
      //                style: TextStyle(
      //                    fontSize: 16, color: Colors.white),
      //                children: [
      //                  TextSpan(
      //                      text: "Mobile: ",
      //                      style: TextStyle(color: GameColor.white)),
      //                  TextSpan(
      //                    text: '7458946942',
      //                    style: TextStyle(
      //                      color: GameColor.white,
      //                      fontWeight: FontWeight.w600,
      //                    ),
      //                  ),
      //                ],
      //              ),
      //            ),
      //            RichText(
      //              textAlign: TextAlign.center,
      //              text: const TextSpan(
      //                style: TextStyle(
      //                    fontSize: 16, color: Colors.white),
      //                children: [
      //                  TextSpan(
      //                      text: "Resiter Time: ",
      //                      style: TextStyle(color: GameColor.white)),
      //                  TextSpan(
      //                    text: '24/11/24',
      //                    style: TextStyle(
      //                      color: GameColor.white,
      //                      fontWeight: FontWeight.w600,
      //                    ),
      //                  ),
      //                ],
      //              ),
      //            ),
      //          ],
      //        ),
      //         Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             RichText(
      //               textAlign: TextAlign.center,
      //               text: const TextSpan(
      //                 style: TextStyle(
      //                     fontSize: 16, color: Colors.white),
      //                 children: [
      //                   TextSpan(
      //                       text: "Level:    ",
      //                       style: TextStyle(color: GameColor.white)),
      //                   TextSpan(
      //                     text: 'C',
      //                     style: TextStyle(
      //                       color: GameColor.white,
      //                       fontWeight: FontWeight.w600,
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //             RichText(
      //               textAlign: TextAlign.center,
      //               text: const TextSpan(
      //                 style: TextStyle(
      //                     fontSize: 16, color: Colors.white),
      //                 children: [
      //                   TextSpan(
      //                       text: "Mobile: ",
      //                       style: TextStyle(color: GameColor.white)),
      //                   TextSpan(
      //                     text: '7458946942',
      //                     style: TextStyle(
      //                       color: GameColor.white,
      //                       fontWeight: FontWeight.w600,
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //             RichText(
      //               textAlign: TextAlign.center,
      //               text: const TextSpan(
      //                 style: TextStyle(
      //                     fontSize: 16, color: Colors.white),
      //                 children: [
      //                   TextSpan(
      //                       text: "Resiter Time: ",
      //                       style: TextStyle(color: GameColor.white)),
      //                   TextSpan(
      //                     text: '24/11/24',
      //                     style: TextStyle(
      //                       color: GameColor.white,
      //                       fontWeight: FontWeight.w600,
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ],
      //         ),
      //       ],
      //     ),
      //
      //     // Padding(
      //     //   padding: const EdgeInsets.all(8.0),
      //     //   child: Card(
      //     //     elevation: 3,
      //     //     shape: RoundedRectangleBorder(
      //     //       borderRadius: BorderRadius.circular(10),
      //     //     ),
      //     //     child: Container(
      //     //       decoration: BoxDecoration(
      //     //           borderRadius: BorderRadius.circular(10),
      //     //           color: GameColor.white),
      //     //       child: TabBar(
      //     //         controller: tabController,
      //     //         dividerColor: Colors.transparent,
      //     //         unselectedLabelColor: GameColor.black,
      //     //         labelColor: GameColor.blue,
      //     //         indicatorSize: TabBarIndicatorSize.label,
      //     //         indicatorColor: GameColor.blue,
      //     //         tabs: const [
      //     //           Tab(
      //     //             text: ("Invalid Member"),
      //     //           ),
      //     //           Tab(
      //     //             text: ("Valid Member"),
      //     //           ),
      //     //         ],
      //     //       ),
      //     //     ),
      //     //   ),
      //     // ),
      //     // // SizedBox(
      //     // //   height: height * 0.77,
      //     // //   child: TabBarView(
      //     // //       controller: tabController,
      //     // //       children: const [
      //     // //     InvalidMemberScreen(),
      //     // //     ValidMemberScreen(),
      //     // //   ]),
      //     // // )
      //   ],
      // ),
    ));
  }
}
