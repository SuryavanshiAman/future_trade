import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:future_trade/generated/assets.dart';
import 'package:future_trade/main.dart';
import 'package:future_trade/res/api_url.dart';
import 'package:future_trade/res/color-const.dart';
import 'package:future_trade/res/constant_app_bar.dart';
import 'package:future_trade/utils/routes/routes_name.dart';
import 'package:future_trade/view/products/product_screen.dart';
import 'package:future_trade/view_model/controller.dart';
import 'package:future_trade/view_model/downline_view_model.dart';
import 'package:future_trade/view_model/product_view_model.dart';
import 'package:future_trade/view_model/profile_view_model.dart';
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
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProfileViewModel>(context,listen: false).getProfileApi(context);
      Provider.of<ProductViewModel>(context,listen: false).productApi(context,"1");
      Provider.of<DownlineViewModel>(context,listen: false).downlineApi(context);
    });
  }
  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<ElementController>(context);
    final user= Provider.of<ProfileViewModel>(context).profileResponse?.data;
    final downline= Provider.of<DownlineViewModel>(context).downlineResponse?.data;
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
              Navigator.pushNamed(context, RoutesName.bottomNavBar,arguments: {"index": 3});
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
            icon:  Icon(Icons.download_for_offline, color: GameColor.white
            ),
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
              leading:  CircleAvatar(
                radius: 22,
                backgroundImage: NetworkImage(
                  "${ApiUrl.imageUrl}${ user?.photo.toString()??""}"
                   ),
              ),
              title:  Text(
                user?.name.toString()??"",
                style: const TextStyle(
                  color: GameColor.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              subtitle:  Text(
                user?.userId.toString()??"",
                style: const TextStyle(
                  color: GameColor.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(height: height * 0.01),
                  const Text(
                    "Downline Details",
                    style: TextStyle(
                      color: GameColor.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  Icon(
                    _customTileExpanded
                        ? Icons.arrow_drop_down_circle
                        : Icons.arrow_drop_down,
                    color: GameColor.white,
                  ),
                ],
              ),
              children: [
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
                      _buildGridTile(downline?.activeDownline??"0.0", "Active Downline"),
                      _buildGridTile(downline?.teamIncome??"0.0", "Team Income"),
                      _buildGridTile(downline?.totalPayout??"0.0", "Total Payout"),
                      _buildGridTile(downline?.todayTeamBusiness??"0.0", "Today Team Business"),
                      _buildGridTile(downline?.totalIncome??"0.0", "Total Income"),
                      _buildGridTile(downline?.incomeWallet??"0.0", "Income Wallet"),
                    ],
                  ),
                ),
              ],
              onExpansionChanged: (bool expanded) {
                setState(() {
                  _customTileExpanded = expanded;
                });
              },
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          const Text(
            "Product",
            style: TextStyle(
                color: GameColor.white,
                fontWeight: FontWeight.w600,
                fontSize: 20),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Container(
            height: height * 0.055,
            width: width,
            decoration: const BoxDecoration(
              color: GameColor.white,
            ),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.productList.length,
                itemBuilder: (BuildContext context, index) {
                  return GestureDetector(
                    onTap: () {
                      categories.setSelectedIndex(index);
                      if (categories.productList[index].onTap != null) {
                        categories.productList[index].onTap!(context);

                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: width * 0.25,
                      color: categories.selectedIndex == index
                          ? GameColor.lightBlue
                          : GameColor.white,
                      child: Text(
                        categories.productList[index].name,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: categories.selectedIndex == index
                              ? GameColor.white
                              : GameColor.black,
                        ),
                      ),
                    ),
                  );
                }),
          ),
          const ProductScreen()
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
