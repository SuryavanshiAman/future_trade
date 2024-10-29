import 'package:future_trade/generated/assets.dart';
import 'package:future_trade/helper/response/status.dart';
import 'package:future_trade/main.dart';
import 'package:future_trade/res/color-const.dart';
import 'package:flutter/material.dart';
import 'package:future_trade/view_model/level_view_model.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ValidMemberScreen extends StatefulWidget {
  const ValidMemberScreen({super.key});

  @override
  _ValidMemberScreenState createState() => _ValidMemberScreenState();
}

class _ValidMemberScreenState extends State<ValidMemberScreen> {
  @override
  void initState() {
    final levelList=  Provider.of<LevelViewModel>(context, listen: false);
    levelList.levelApi(context, "2");
    Future.delayed(const Duration(seconds: 1),(){
      _changeCategory( 0, levelList);
    });
    //
    super.initState();
  }


  int _selectedCategoryIndex = 0;
  Color _containerColor = Colors.white;
  String? selectedLevel;
  List<dynamic>? selectedData;
  void _changeCategory(int index, LevelViewModel levelList) {
    setState(() {
      _selectedCategoryIndex = index;
      selectedData = _getDataForLevel(levelList, levelList.levelList.data?.data?[index].teamLevel ?? '');
      _containerColor =
          GameColor.blue; // Change container color when category is tapped
    });
  }
  List<dynamic>? _getDataForLevel(LevelViewModel levelList, String level) {
    // Retrieve data based on selected level
    for (var data in levelList.levelList.data!.data!) {
      if (data.teamLevel == level) {
        switch (level) {
          case 'A':
            return data.a; // Get data for level A
          case 'B':
            return data.b; // Get data for level B
          case 'C':
            return data.c; // Get data for level C
          case 'D':
            return data.d; // Get data for level D
          case 'E':
            return data.e; // Get data for level E
        }
      }
    }
    return null; // Return null if no data found
  }
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: GameColor.blue),
                color: _containerColor,
              ),
              child: Consumer<LevelViewModel>(
                builder: (context, levelList, _) {
                  switch (levelList.levelList.status) {
                    case Status.LOADING:
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    case Status.ERROR:
                      return Container();
                    case Status.COMPLETED:
                      final levelData = levelList.levelList.data!.data;
                      if (levelData != null && levelData.isNotEmpty) {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: levelData.length, // Number of categories
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                _changeCategory(index,levelList);
                              },
                              child: Container(
                                width: 72,
                                color: _selectedCategoryIndex == index
                                    ? GameColor.blue
                                    : GameColor.white,
                                child: Center(
                                    child: Text(
                                      "${levelData[index].teamLevel}-2%(${levelData[index].totalCount.toString()})",
                                      style: TextStyle(
                                          color: _selectedCategoryIndex == index
                                              ? GameColor.white
                                              : GameColor.black),
                                    )),
                              ),
                            );
                          },
                        );
                      } else {
                        return Padding(
                          padding: EdgeInsets.only(top: height * 0.15),
                          child: const Text(
                            "No Data  Found!",
                            style:
                            TextStyle(color: GameColor.white, fontSize: 16),
                          ),
                        );
                      }
                    default:
                      return Container();
                  }
                },
              )),
        ),
        const SizedBox(
          height: 10,
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                    width: 80,
                    // color: Colors.red,
                    child: Text(
                      "mobile.no".toUpperCase(),
                      style: const TextStyle(color: GameColor.white),
                    )),
                SizedBox(
                    width: 80,
                    child: Text(
                      "level".toUpperCase(),
                      style: const TextStyle(color: GameColor.white),
                    )),
                SizedBox(
                    width: 140,
                    child: Text(
                      "registration time".toUpperCase(),
                      style: const TextStyle(color: GameColor.white),
                    )),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Consumer<LevelViewModel>(
              builder: (context, levelList, _) {
                switch (levelList.levelList.status) {
                  case Status.LOADING:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  case Status.ERROR:
                    return Container();
                  case Status.COMPLETED:
                    final levelData = levelList.levelList.data?.data;
                    if (selectedData != null && selectedData!.isNotEmpty) {
                      return ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: selectedData?.length??0,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                        width: 80,
                                        child: Text(
                                          selectedData?[index].phone.toString()??"",
                                          style: const TextStyle(
                                              color: GameColor.white,
                                              fontSize: 12),
                                        )),
                                    Container(
                                        alignment: Alignment.center,
                                        width: 80,
                                        child: Text(
                                          selectedData?[index].teamLevel.toString()??"",
                                          style: const TextStyle(
                                              color: GameColor.white,
                                              fontSize: 12),
                                        )),
                                    Container(
                                        alignment: Alignment.center,
                                        width: 140,
                                        child:  Text(
                                          DateFormat("dd/MM/yy").format(DateTime.parse( selectedData?[index].datetime.toString()??"")),
                                          style: const TextStyle(
                                              color: GameColor.white,
                                              fontSize: 12),
                                        )),
                                  ],
                                ),
                              ),
                              const Divider(
                                thickness: 1.5,
                              )
                            ],
                          );
                        },
                      );
                    } else {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: height*0.2,),
                          Image.asset(Assets.imagesNoData,scale: 2,),
                          SizedBox(height: height*0.01,),
                          const Text(
                            "No Team Data Found!",
                            style: TextStyle(color: GameColor.white, fontSize: 16),
                          ),

                        ],
                      );
                    }
                  default:
                    return Container();
                }
              },
            ),
          ],
        )
      ],
    );
  }
}
