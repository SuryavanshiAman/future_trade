
import 'package:future_trade/res/color-const.dart';
import 'package:flutter/material.dart';

class ValidMemberScreen extends StatefulWidget {
  const ValidMemberScreen({super.key});

  @override
  _ValidMemberScreenState createState() => _ValidMemberScreenState();
}

class _ValidMemberScreenState extends State<ValidMemberScreen> {
  int _selectedCategoryIndex = 0;
  Color _containerColor = Colors.white;

  void _changeCategory(int index) {
    setState(() {
      _selectedCategoryIndex = index;
      _containerColor =
          GameColor.purple;
    });
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
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: GameColor.purple),
              color: _containerColor,
            ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _changeCategory(index);
                  },
                  child: Container(
                    width: 170,
                    color: _selectedCategoryIndex == index
                        ? GameColor.purple
                        : Colors.white,
                    child:  Center(
                        child: Text(
                      'A' +
                          '-'
                              ''
                              '2' +
                          '%' +
                          "(" '3' +
                          ")",
                      style: TextStyle(color:_selectedCategoryIndex == index
                          ? GameColor.white
                          : Colors.black,),
                    )),
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    width: 80,
                    child: Center(
                        child: Text(
                      "account".toUpperCase(),
                      style: const TextStyle(color: GameColor.white),
                    ))),
                Container(
                    alignment: Alignment.center,
                    width: 80,
                    // color: Colors.red,
                    child: Text(
                      "level".toUpperCase(),
                      style: const TextStyle(color: GameColor.white),
                    )),
                Container(
                    alignment: Alignment.center,
                    width: 140,
                    // color: Colors.red,
                    child: Text(
                      "registration time".toUpperCase(),
                      style: const TextStyle(color: GameColor.white),
                    )),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: 3, // Number of categories
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              alignment: Alignment.center,
                              width: 80,
                              // color: Colors.red,
                              child: const Text(
                                '9793168164',
                                style: TextStyle(color: GameColor.white,fontSize: 12),
                              )),
                          Container(
                              alignment: Alignment.center,
                              width: 80,
                              // color: Colors.red,
                              child: Text(
                                '1'.toUpperCase(),
                                style: const TextStyle(color: GameColor.white,fontSize: 12),
                              )),
                          Container(
                              alignment: Alignment.center,
                              width: 140,
                              // color: Colors.red,
                              child: const Text(
                                '2',
                                style: TextStyle(color: GameColor.white,fontSize: 12),
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
            ),
          ],
        )
      ],
    );
  }
}
