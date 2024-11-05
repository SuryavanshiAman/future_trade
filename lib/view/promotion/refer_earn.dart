import 'package:flutter/material.dart';
import 'package:future_trade/generated/assets.dart';
import 'package:future_trade/helper/response/status.dart';
import 'package:future_trade/main.dart';
import 'package:future_trade/res/api_url.dart';
import 'package:future_trade/res/clipBoardPage.dart';
import 'package:future_trade/res/color-const.dart';
import 'package:future_trade/res/constantButton.dart';
import 'package:future_trade/res/constant_app_bar.dart';
import 'package:future_trade/view_model/profile_view_model.dart';
import 'package:future_trade/view_model/referral_list_view_model.dart';
import 'package:provider/provider.dart';

class ReferEarnScreen extends StatefulWidget {
  const ReferEarnScreen({super.key});

  @override
  State<ReferEarnScreen> createState() => _ReferEarnScreenState();
}

class _ReferEarnScreenState extends State<ReferEarnScreen> {
  ReferralListViewModel referralListViewModel=ReferralListViewModel();
  @override
  void initState() {

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ReferralListViewModel>(context,listen: false).referralListApi(context);
    });

  }
  @override
  Widget build(BuildContext context) {
    final user= Provider.of<ProfileViewModel>(context).profileResponse?.data;
    return SafeArea(
        child: Scaffold(
      backgroundColor: GameColor.black,
      appBar: const ConstantAppBar(
        title: Text(
          "Refer&Earn",
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
              child: Container(
                height: height * 0.35,
                width: width * 0.99,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: GameColor.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Invitation code",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: GameColor.black,
                          fontSize: 20),
                    ),
                    Text(
                        Uri.parse(user?.referralCode.toString() ?? "").queryParameters['refcode'] ?? "",
                      // user?.referralCode.toString()??"",
                      style: TextStyle(
                          fontSize: 20,
                          color: GameColor.black,
                          fontWeight: FontWeight.w900),
                    ),
                    Text(
                      "invite link",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: GameColor.black,
                          fontSize: 16),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: height * 0.07,
                      width: width * 0.7,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: GameColor.gray,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(2)),
                          color: GameColor.white),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          user?.referralCode.toString()??"",
                          style: TextStyle(
                            color: GameColor.gray,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    ConstantButton(
                      onTap: () {
                        copyToClipboard(user?.referralCode.toString()??"",context);
                      },
                      text: 'Copy invitation link',
                      btnColor: GameColor.blue,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 1,
                width: width * 0.3,
                color: GameColor.white,
              ),
              const Text("Invitation History",
                  style: TextStyle(
                      color: GameColor.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18)),
              Container(
                height: 1,
                width: width * 0.3,
                color: GameColor.white,
              ),
            ],
          ),
          Consumer<ReferralListViewModel>(
            builder: (context, referralList, _) {
              switch (
              referralList.referralList.status) {
                case Status.LOADING:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case Status.ERROR:
                  return Container();
                case Status.COMPLETED:
                  final listData = referralList.referralList.data!.data;
                  if (listData != null && listData.isNotEmpty) {
                    return Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: listData.length,
                          itemBuilder: (BuildContext context, index) {
                            return    Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: GameColor.white,

                                ),
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: GameColor.blue.withOpacity(0.9),
                                    backgroundImage: NetworkImage("${ApiUrl.imageUrl}${listData[index].img}"),
                                  ),
                                  title: Text(listData[index].username.toString(),
                                      style: TextStyle(
                                          color: GameColor.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14)),
                                  subtitle:  Text(listData[index].totalProjects.toString(),
                                      style: const TextStyle(
                                          color: GameColor.blue,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14)),
                                  trailing: Text(
                                    listData[index].status.toString(),
                                    style: TextStyle(
                                        color:listData[index].status.toString()=="Pending" ?GameColor.gameRed:Colors.green,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14),
                                  ),
                                ),
                              ),
                            );
                          }),
                    );
                  } else {
                    return  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: height*0.1,),
                        Image.asset(Assets.imagesNoData,scale: 2,),
                        SizedBox(height: height*0.01,),
                        const Text(
                          "No Referral History Found!",
                          style: TextStyle(color: GameColor.white, fontSize: 16),
                        ),

                      ],
                    );
                  }
                default:
                  return Container();
              }
            },
          )

        ],
      ),
    ));
  }

}
