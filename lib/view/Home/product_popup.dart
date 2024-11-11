// // // dialog_page.dart
// // import 'package:flutter/material.dart';
// // import 'package:future_trade/res/color-const.dart';
// // import 'package:future_trade/view_model/controller.dart';
// // import 'package:provider/provider.dart';
// //
// // class DialogPage extends StatelessWidget {
// //   final String title;
// //
// //   DialogPage({required this.title});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final history = Provider.of<ElementController>(context);
// //     return
// //     Center(
// //         child: AlertDialog(
// //           title: Text('Item Selected'),
// //           content: ListView.builder(
// //               itemCount:history.items.length,
// //               padding: const EdgeInsets.all(8.0),
// //               scrollDirection: Axis.vertical,
// //               shrinkWrap: true,
// //               physics: const BouncingScrollPhysics(),
// //               itemBuilder: (BuildContext context, int index) {
// //
// //                 return Container(
// //                   decoration: const BoxDecoration(
// //                       border: Border(
// //                           bottom: BorderSide(color: GameColor.blue))),
// //                   child: ListTile(
// //
// //                     title: Text(history.items[index]['title'],
// //                         style:  TextStyle(
// //                             color: GameColor.black,
// //                             fontSize: 16,
// //                             fontWeight: FontWeight.w600)),
// //                     subtitle: Text(
// //                        "Price:${history.items[index]['subtitle']}",
// //                         style:  TextStyle(
// //                             fontWeight: FontWeight.w600,
// //                             color: GameColor.black,
// //                             fontSize: 14)),
// //                     // trailing: Column(
// //                     //   mainAxisAlignment: MainAxisAlignment.end,
// //                     //   children: [
// //                     //     Text(
// //                     //         listData[index].type.toString() == "1"
// //                     //             ? "+₹${listData[index].amount.toString()}"
// //                     //             : "-₹${listData[index].amount.toString()}",
// //                     //         style: TextStyle(
// //                     //             color:
// //                     //             listData[index].type.toString() ==
// //                     //                 "1"
// //                     //                 ? GameColor.green
// //                     //                 : GameColor.gameRed,
// //                     //             fontSize: 16,
// //                     //             fontWeight: FontWeight.w600)),
// //                     //     Text(
// //                     //         listData[index].status.toString() == "1"
// //                     //             ? "Success"
// //                     //             : listData[index].status.toString() ==
// //                     //             "2"
// //                     //             ? "Pending"
// //                     //             : "Failed",
// //                     //         style: TextStyle(
// //                     //             color:
// //                     //             listData[index].status.toString() ==
// //                     //                 "1"
// //                     //                 ? GameColor.green
// //                     //                 : listData[index]
// //                     //                 .status
// //                     //                 .toString() ==
// //                     //                 "2"
// //                     //                 ? GameColor.yellow
// //                     //                 : GameColor.gameRed,
// //                     //             fontSize: 12,
// //                     //             fontWeight: FontWeight.w600)),
// //                     //   ],
// //                     // ),
// //                   ),
// //                 );
// //               })
// //           // actions: [
// //           //   TextButton(
// //           //     onPressed: () {
// //           //       Navigator.of(context).pop();
// //           //     },
// //           //     child: Text('OK'),
// //           //   ),
// //           // ],
// //         ),
// //       );
// //
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:future_trade/main.dart';
// import 'package:future_trade/res/color-const.dart';
// import 'package:future_trade/view_model/controller.dart';
// import 'package:provider/provider.dart';
//
// class DialogPage extends StatelessWidget {
//   final String title;
//
//   DialogPage({required this.title});
//
//   @override
//   Widget build(BuildContext context) {
//     final history = Provider.of<ElementController>(context);
//
//     return Center(
//       child: SizedBox(
//         height: height*0.5,
//         child: Dialog(
//           backgroundColor: GameColor.white,
//           child: Column(
//             children: [
//                Text('Item Selected'),
//             ListView.builder(
//               itemCount: history.items.length,
//               shrinkWrap: true,
//               physics: BouncingScrollPhysics(),
//               itemBuilder: (BuildContext context, int index) {
//                 return Container(
//                   decoration: const BoxDecoration(
//                     border: Border(
//                       bottom: BorderSide(color: GameColor.blue),
//                     ),
//                   ),
//                   child: ListTile(
//                     title: Text(
//                       history.items[index]['title'],
//                       style: TextStyle(
//                         color: GameColor.black,
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                     subtitle: Text(
//                       "Price: ${history.items[index]['subtitle']}",
//                       style: TextStyle(
//                         fontWeight: FontWeight.w600,
//                         color: GameColor.black,
//                         fontSize: 14,
//                       ),
//                     ),
//                     trailing: Column(
//                       children: [
//                         Checkbox(
//                           value: history.selectedItems[index],
//                           onChanged: (bool? value) {
//                             setState(() {
//                               history.selectedItems[index] = value!;
//                             });
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//             ],
//           ),
//
//
//         ),
//       ),
//     );
//   }
// }
