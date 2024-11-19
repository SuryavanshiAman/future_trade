import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:future_trade/generated/assets.dart';
import 'package:future_trade/main.dart';
import 'package:future_trade/res/api_url.dart';
import 'package:future_trade/res/circular_button.dart';
import 'package:future_trade/res/color-const.dart';
import 'package:future_trade/res/constantButton.dart';
import 'package:future_trade/res/constant_app_bar.dart';
import 'package:future_trade/utils/routes/routes_name.dart';
import 'package:future_trade/utils/utils.dart';
import 'package:future_trade/view/Home/slider.dart';
import 'package:future_trade/view_model/downline_view_model.dart';
import 'package:future_trade/view_model/join_view_model.dart';
import 'package:future_trade/view_model/note_view_model.dart';
import 'package:future_trade/view_model/product_category_view_model.dart';
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
  // bool _customTileExpanded = false;
  int selectedIndex = 0;
  String _dropDownValue = "";
  String selectedData = "";
  bool isExpanded = false;
  String productId = '';
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProfileViewModel>(context, listen: false)
          .getProfileApi(context);
      Provider.of<NoteViewModel>(context, listen: false).noteApi(context);
      Provider.of<ProductCategoryViewModel>(context, listen: false)
          .productCategoryApi(
        context,
      );
      Provider.of<ProductViewModel>(context, listen: false)
          .productApi(context, "1");
      Provider.of<DownlineViewModel>(context, listen: false)
          .downlineApi(context);
    });
  }

  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductViewModel>(context);
    final categories = Provider.of<ProductCategoryViewModel>(context);
    final note = Provider.of<NoteViewModel>(context).noteResponse?.data;
    final user = Provider.of<ProfileViewModel>(context).profileResponse?.data;
    final downline =
        Provider.of<DownlineViewModel>(context).downlineResponse?.data;
    final join = Provider.of<JoinViewModel>(context);
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
      body: Stack(
        children: [
          ListView(
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
                    "ID:${user?.userId.toString() ?? " "}",
                    style: const TextStyle(
                      color: GameColor.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
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
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 2.5,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    _buildGridTile(
                        downline?.activeDownline ?? "0.0", "Active Downline"),
                    _buildGridTile(
                        downline?.teamIncome ?? "0.0", "Team Income"),
                    _buildGridTile(
                        downline?.totalPayout ?? "0.0", "Total Payout"),
                    _buildGridTile(downline?.todayTeamBusiness ?? "0.0",
                        "Today Team Business"),
                    _buildGridTile(
                        downline?.dailyIncome ?? "0.0", "Daily Income"),
                    _buildGridTile(
                        downline?.totalIncome ?? "0.0", "Total Income"),
                    _buildGridTile(
                        downline?.incomeWallet ?? "0.0", "Income Wallet"),
                    _buildGridTile(
                        downline?.cashbackIncome ?? "0.0", "Cashback Income"),
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
                    width: width * 0.85,
                    height: height * 0.05,
                    color: GameColor.gray, // Background color for the marquee
                    child: Marquee(
                      text: note?.homeNote?.isNotEmpty == true
                          ? note!.homeNote.toString()
                          : "No note available",
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
                          colors: [
                            Color(0xFF000000),
                            Color(0xFF000000),
                            Color(0xFF2d2f30)
                          ],
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "₹${user?.wallet ?? ""}",
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: GameColor.white),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RoutesName.depositScreen);
                            },
                            child: const Icon(
                              Icons.wallet,
                              color: GameColor.white,
                            ),
                          ),
                        ],
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
                            colors: [
                              Color(0xFF000000),
                              Color(0xFF000000),
                              Color(0xFF2d2f30)
                            ],
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
                            dropdownColor: GameColor.gray,
                            hint: _dropDownValue.isEmpty
                                ? const Text(
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
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            // items: ['Nifty50', 'Bank Nifty', 'USD', 'BitCoin']
                            items: (categories.productCategoryList.data?.data ??
                                    [])
                                .map((val) {
                                  final uniqueValue =
                                      "${val.name?.toString() ?? "0"}";
                                  return DropdownMenuItem<String>(
                                    value: uniqueValue,
                                    child: Text(uniqueValue),
                                  );
                                })
                                .toSet()
                                .toList(),
                            onChanged: (val) {
                              setState(() {
                                _dropDownValue = val!;
                                final index = categories
                                    .productCategoryList.data?.data
                                    ?.where((e) => e.name == val)
                                    .first
                                    .type;
                                selectedData = "";
                                isExpanded = false;
                                Provider.of<ProductViewModel>(context,
                                        listen: false)
                                    .productApi(context, index);
                              });
                            },
                            value:
                                _dropDownValue.isEmpty ? null : _dropDownValue,
                          ),
                        )),
                    const Text(
                      "Packages",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: GameColor.white),
                    ),
                    if (product.productList.data != null)
                      Container(
                          padding: const EdgeInsets.all(8),
                          alignment: Alignment.centerLeft,
                          width: width,
                          height: height * 0.09,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFF000000),
                                Color(0xFF000000),
                                Color(0xFF2d2f30)
                              ],
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
                              dropdownColor: GameColor.gray,
                              hint: selectedData.isEmpty
                                  ? const Text(
                                      'Select',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: GameColor.white,
                                      ),
                                    )
                                  : Text(
                                      selectedData,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                              isExpanded: true,
                              iconSize: 30.0,
                              style: const TextStyle(
                                color: Colors.blue,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              items: (product.productList.data?.data)!
                                  .map((item) {
                                    final aa = item.productName;
                                    return DropdownMenuItem<String>(
                                      value: aa,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              width: 1.0, // Set border width
                                            ),
                                          ),
                                        ),
                                        child: ListTile(
                                          contentPadding: EdgeInsets.zero,
                                          title: Text(
                                            item.productName.toString(),
                                            style: TextStyle(
                                              color: isExpanded
                                                  ? GameColor.white
                                                  : GameColor.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          subtitle: Text(
                                            "Price: ${item.productPrice.toString()}",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: isExpanded
                                                  ? GameColor.white
                                                  : GameColor.white,
                                              fontSize: 14,
                                            ),
                                          ),
                                          trailing: Text(
                                            "ROI:${user?.roi ?? ""}%",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: isExpanded
                                                  ? GameColor.white
                                                  : GameColor.white,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  })
                                  .toSet()
                                  .toList(),
                              onChanged: (String? item) {
                                setState(() {
                                  print(item);
                                  selectedData = item ?? "";
                                  isExpanded = true;
                                  print("SelectedData:$selectedData");
                                  final id = product.productList.data?.data
                                      ?.where((e) => e.productName == item)
                                      .first
                                      .id;
                                  productId = id.toString();
                                });
                              },
                              itemHeight: height * 0.1,
                              value: selectedData.isEmpty ? null : selectedData,
                            ),
                          )),
                    SizedBox(
                      height: height * 0.015,
                    ),
                    join.loading == false
                        ? Center(
                            child: ConstantButton(
                              onTap: () {
                                if (productId == "null") {
                                  Utils.flushBarErrorMessage(
                                      "Please join any project", context);
                                } else {
                                  join.joinApi(productId, context);
                                }
                              },
                              text: 'Join',
                            ),
                          )
                        : const Center(child: CircularButton()),
                    SizedBox(
                      height: height * 0.05,
                    )
                  ],
                ),
              )
            ],
          ),
          user == null
              ? Container(
                  height: height,
                  width: width,
                  child: const Center(
                      child: CircularProgressIndicator(
                    color: GameColor.white,
                  )),
                )
              : Container()
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
