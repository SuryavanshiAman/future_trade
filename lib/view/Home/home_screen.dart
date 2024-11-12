import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:future_trade/generated/assets.dart';
import 'package:future_trade/main.dart';
import 'package:future_trade/res/api_url.dart';
import 'package:future_trade/res/color-const.dart';
import 'package:future_trade/res/constantButton.dart';
import 'package:future_trade/res/constant_app_bar.dart';
import 'package:future_trade/utils/routes/routes_name.dart';
import 'package:future_trade/view/Home/product_popup.dart';
import 'package:future_trade/view/Home/slider.dart';
import 'package:future_trade/view/products/product_screen.dart';
import 'package:future_trade/view_model/controller.dart';
import 'package:future_trade/view_model/downline_view_model.dart';
import 'package:future_trade/view_model/product_view_model.dart';
import 'package:future_trade/view_model/profile_view_model.dart';
import 'package:marquee/marquee.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _customTileExpanded = false;
  int selectedIndex = 0;
  String _dropDownValue = "";
  String selectedData = "";
  // List<bool> isCheckedList = [];
  @override
  void initState() {
    super.initState();
    final categories = Provider.of<ElementController>(context,listen: false);
    // isCheckedList = List<bool>.filled(categories.product.length, false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProfileViewModel>(context, listen: false)
          .getProfileApi(context);
      Provider.of<ProductViewModel>(context, listen: false)
          .productApi(context, "1");
      Provider.of<DownlineViewModel>(context, listen: false)
          .downlineApi(context);
    });
  }

  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    final history = Provider.of<ElementController>(context);
    final categories = Provider.of<ElementController>(context);
    final user = Provider.of<ProfileViewModel>(context).profileResponse?.data;
    final downline =
        Provider.of<DownlineViewModel>(context).downlineResponse?.data;
    return Scaffold(
      backgroundColor: GameColor.black,
      appBar: ConstantAppBar(
        centerTitle: true,
        title: Image.asset(
          Assets.imagesFutureTradeLogo,
          scale: 1.2,
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, RoutesName.bottomNavBar,
                  arguments: {"index": 3});
            },
            child: const Icon(
              Icons.wallet,
              color: GameColor.white,
            ),
          ),
          kIsWeb == true
              ? IconButton(
                  onPressed: () {
                    downloadApkLauncher();
                  },
                  icon: const Icon(Icons.download_for_offline,
                      color: GameColor.white),
                )
              : Container(),
          SizedBox(
            width: width * 0.02,
          )
        ],
      ),
      body: ListView(
        children: [
          Theme(
            data: Theme.of(context).copyWith(
              dividerColor: Colors.transparent,
            ),
            child: ExpansionTile(
              leading: CircleAvatar(
                radius: 22,
                backgroundImage: NetworkImage(
                    "${ApiUrl.imageUrl}${user?.photo.toString() ?? ""}"),
              ),
              title: Text(
                user?.name.toString() ?? "",
                style: const TextStyle(
                  color: GameColor.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),

              trailing: Text(
               "ID:${ user?.userId.toString() ?? " "}",
                style: const TextStyle(
                  color: GameColor.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.end,
              //   children: [
              //     SizedBox(height: height * 0.01),
              //      Text(
              //       user?.userId.toString()??""
              //       "Downline Details",
              //       style:const TextStyle(
              //         color: GameColor.white,
              //         fontWeight: FontWeight.bold,
              //         fontSize: 14,
              //       ),
              //     ),
              //     Icon(
              //       _customTileExpanded
              //           ? Icons.arrow_drop_down_circle
              //           : Icons.arrow_drop_down,
              //       color: GameColor.white,
              //     ),
              //   ],
              // ),
              // children: [
              //   Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: GridView.count(
              //       shrinkWrap: true,
              //       crossAxisCount: 2, // 3 items per row
              //       crossAxisSpacing: 8,
              //       mainAxisSpacing: 8,
              //       childAspectRatio: 2.5,
              //       physics: const NeverScrollableScrollPhysics(),
              //       children: [
              //         _buildGridTile(downline?.activeDownline??"0.0", "Active Downline"),
              //         _buildGridTile(downline?.teamIncome??"0.0", "Team Income"),
              //         _buildGridTile(downline?.totalPayout??"0.0", "Total Payout"),
              //         _buildGridTile(downline?.todayTeamBusiness??"0.0", "Today Team Business"),
              //         _buildGridTile(downline?.totalIncome??"0.0", "Total Income"),
              //         _buildGridTile(downline?.incomeWallet??"0.0", "Income Wallet"),
              //       ],
              //     ),
              //   ),
              // ],
              // onExpansionChanged: (bool expanded) {
              //   setState(() {
              //     _customTileExpanded = expanded;
              //   });
              // },
            ),
          ),
          const Text(
            "Downline Details",
            style: TextStyle(
              color: GameColor.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2, // 3 items per row
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 2.5,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildGridTile(
                    downline?.activeDownline ?? "0.0", "Active Downline"),
                _buildGridTile(downline?.teamIncome ?? "0.0", "Team Income"),
                _buildGridTile(downline?.totalPayout ?? "0.0", "Total Payout"),
                _buildGridTile(downline?.todayTeamBusiness ?? "0.0",
                    "Today Team Business"),
                _buildGridTile(downline?.todayTeamBusiness ?? "0.0",
                    "Daily Income"),
                _buildGridTile(downline?.totalIncome ?? "0.0", "Total Income"),
                _buildGridTile(
                    downline?.incomeWallet ?? "0.0", "Income Wallet"),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                alignment: Alignment.center,
                height: height * 0.05,
                color: GameColor.gray,
                child: const Text(
                  "Note:",
                  style: TextStyle(
                    color: GameColor.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                // // padding: EdgeInsets.all(5),
                width: width * 0.85,
                height: height * 0.05,
                color: GameColor.gray, // Background color for the marquee
                child: Marquee(
                  text:
                      'This is an example of marquee Background color for the marquee',
                  style: const TextStyle(
                    fontSize: 16, // Font size
                    color: Colors.white, // Text color
                  ),
                  scrollAxis: Axis.horizontal,
                  blankSpace: 15.0, // Space between repetitions
                  velocity: 50.0, // Speed of the scroll
                  startPadding: 200.0,
                  decelerationCurve: Curves.easeOut,
                ),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.02,
          ),
          const SliderPage(),
          SizedBox(
            height: height * 0.02,
          ),
          Container(
            padding: const EdgeInsets.all(5),
            // color: GameColor.blue,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.01,
                ),
                const Text(
                  "Wallet:",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: GameColor.white),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  alignment: Alignment.centerLeft,
                  height: height * 0.05,
                  width: width,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF000000), Color(0xFF000000), Color(0xFF2d2f30)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: GameColor.lightPink.withOpacity(0.7),
                        blurRadius: 1,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  // color: GameColor.white,
                  child: Text(
                    "₹100",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: GameColor.white),
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                const Text(
                  "Categories:",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: GameColor.white),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                    alignment: Alignment.centerLeft,
                    width: width,
                    height: height * 0.05,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF000000), Color(0xFF000000), Color(0xFF2d2f30)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: GameColor.lightPink.withOpacity(0.7),
                          blurRadius: 1,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    // color: GameColor.white,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        hint: _dropDownValue.isEmpty
                            ? Text(
                                'Select',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: GameColor.white,
                                ),
                              )
                            : Text(
                                _dropDownValue,
                                style: const TextStyle(color: Colors.white),
                              ),
                        isExpanded: true,
                        iconSize: 30.0,
                        style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        items: ['Nifty50', 'Bank Nifty', 'USD', 'BitCoin']
                            .map((val) {
                          return DropdownMenuItem<String>(
                            value: val,
                            child: Text(val),
                          );
                        }).toList(),
                        onChanged: (val) {
                          setState(() {
                            _dropDownValue = val!;
                          });
                        },
                      ),
                    )),
                const Text("Packages",  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: GameColor.white),),
                Container(
                    padding: const EdgeInsets.all(8),
                    alignment: Alignment.centerLeft,
                    width: width,
                    height: height * 0.09,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF000000), Color(0xFF000000), Color(0xFF2d2f30)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: GameColor.lightPink.withOpacity(0.7),
                          blurRadius: 1,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        dropdownColor: GameColor.white,
                        hint: selectedData.isEmpty
                            ? Text(
                          'Select',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: GameColor.white,
                          ),
                        )
                            : Text(
                          selectedData,
                          style: const TextStyle(color: Colors.white),
                        ),
                        isExpanded: true,
                        iconSize: 30.0,
                        style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        items: history.items.map((item)  {
                          int index = history.items.indexOf(item);
                          return DropdownMenuItem<String>(
                            value: item['title'], // Use the title as the dropdown value
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.grey.withOpacity(0.5), // Adjust the border color and opacity
                                    width: 1.0, // Set border width
                                  ),
                                ),
                                // gradient: const LinearGradient(
                                //   colors: [Color(0xFF000000), Color(0xFF000000), Color(0xFF2d2f30)],
                                //   begin: Alignment.topLeft,
                                //   end: Alignment.bottomRight,
                                // ),
                              ),
                              child: ListTile(
                                contentPadding: EdgeInsets.zero, // Remove inner padding for the ListTile
                                title: Text(
                                  item['title'],
                                  style: TextStyle(
                                    color: GameColor.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                subtitle: Text(
                                  "Price: ${item['subtitle']}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: GameColor.black,
                                    fontSize: 14,
                                  ),
                                ),
                                trailing:  Text(
                                  "ROI:10%",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: GameColor.black,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),

                          );
                        }).toList(),
                        onChanged: (String?item) {
                          setState(() {
                            selectedData = item!;
                          });
                        },
                        itemHeight: height*0.1,
                        value: selectedData.isEmpty ? null : selectedData,
                      ),
                    )),
                SizedBox(
                  height: height * 0.015,
                ),
                Center(
                  child: ConstantButton(onTap: () {
                    Navigator.pushNamed(context, RoutesName.bottomNavBar,
                        arguments: {"index": 1});
                  }, text: 'Join',

                  ),
                ),
                SizedBox(height: height*0.05,)
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildGridTile(String amount, String label) {
    return Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF000000), Color(0xFF000000), Color(0xFF2d2f30)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: GameColor.lightPink.withOpacity(0.7),
              blurRadius: 1,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 21,
                backgroundImage: AssetImage(Assets.imagesUser),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    amount,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    label,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
  downloadApkLauncher() async {
    var url = "${ApiUrl.baseUrl}apk/future_trade.apk";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
