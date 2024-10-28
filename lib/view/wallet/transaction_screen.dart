import 'package:flutter/material.dart';
import 'package:future_trade/helper/response/status.dart';
import 'package:future_trade/main.dart';
import 'package:future_trade/model/transaction_history_model.dart';
import 'package:future_trade/res/color-const.dart';
import 'package:future_trade/res/constant_app_bar.dart';
import 'package:future_trade/view_model/referral_list_view_model.dart';
import 'package:future_trade/view_model/transaction_history_view_model.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  @override
  void initState() {
    Provider.of<TransactionHistoryViewModel>(context, listen: false)
        .transactionHistoryApi(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            "Transaction History",
            style:
                TextStyle(fontWeight: FontWeight.w600, color: GameColor.white),
          ),
          centerTitle: true,
        ),
        body: Consumer<TransactionHistoryViewModel>(
          builder: (context, transaction, _) {
            switch (transaction.transactionList.status) {
              case Status.LOADING:
                return const Center(
                  child: CircularProgressIndicator(color: GameColor.white,),
                );
              case Status.ERROR:
                return Container();
              case Status.COMPLETED:
                final listData = transaction.transactionList.data!.data;
                if (listData != null && listData.isNotEmpty) {
                  return ListView.builder(
                      itemCount: listData.length,
                      padding: const EdgeInsets.all(8.0),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: GameColor.white))),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: GameColor.blue,
                              child: Text(
                                  listData[index].type.toString() == "1"
                                      ? "CR"
                                      : "DR",
                                  style: const TextStyle(
                                      color: GameColor.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600)),
                            ),
                            title: Text(listData[index].description.toString(),
                                style: const TextStyle(
                                    color: GameColor.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600)),
                            subtitle: Text(
                                listData[index].type.toString() == "1"
                                    ? "Credit on ${DateFormat("d MMM, hh:mm a").format(DateTime.parse(listData[index].datetime.toString()))}"
                                    : "Debit on ${DateFormat("d MMM, hh:mm a").format(DateTime.parse(listData[index].datetime.toString()))}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: GameColor.white,
                                    fontSize: 14)),
                            trailing: Text(
                                listData[index].type.toString() == "1"
                                    ? "+₹${listData[index].amount.toString()}"
                                    : "-₹${listData[index].amount.toString()}",
                                style: TextStyle(
                                    color:
                                        listData[index].type.toString() == "1"
                                            ? GameColor.green
                                            : GameColor.gameRed,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600)),
                          ),
                        );
                      });
                } else {
                  return Padding(
                    padding: EdgeInsets.only(top: height * 0.15),
                    child: const Text(
                      "No Transaction History Found!",
                      style: TextStyle(color: GameColor.white, fontSize: 16),
                    ),
                  );
                }
              default:
                return Container();
            }
          },
        ));
  }
}
