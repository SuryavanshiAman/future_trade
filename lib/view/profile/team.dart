import 'package:flutter/material.dart';
import 'package:future_trade/res/color-const.dart';
import 'package:future_trade/res/constant_app_bar.dart';
import 'package:future_trade/view/profile/invalidmember.dart';
import 'package:future_trade/view/profile/validmember.dart';

class MyTeam extends StatefulWidget {
  const MyTeam({super.key});

  @override
  State<MyTeam> createState() => _MyTeamState();
}

class _MyTeamState extends State<MyTeam> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    TabController tabController = TabController(length: 2, vsync: this);
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: GameColor.white),
                child: TabBar(
                  controller: tabController,
                  unselectedLabelColor: GameColor.black,
                  labelColor: GameColor.blue,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: GameColor.blue,
                  tabs: const [
                    Tab(
                      text: ("Invalid Member"),
                    ),
                    Tab(
                      text: ("Valid Member"),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.77,
            child: TabBarView(
                controller: tabController,
                children: const [
              InvalidMemberScreen(),
              ValidMemberScreen(),
            ]),
          )
        ],
      ),
    ));
  }
}
