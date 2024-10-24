
import 'package:future_trade/res/color-const.dart';
import 'package:flutter/material.dart';

class InvalidMemberScreen extends StatefulWidget {
  const InvalidMemberScreen({super.key});

  @override
  _InvalidMemberScreenState createState() => _InvalidMemberScreenState();
}

class _InvalidMemberScreenState extends State<InvalidMemberScreen> {
  int _selectedCategoryIndex = 0;
  Color _containerColor = Colors.white;

  void _changeCategory(int index) {
    setState(() {
      _selectedCategoryIndex = index;
      _containerColor =
          GameColor.purple; // Change container color when category is tapped
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
              itemCount: 2, // Number of categories
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _changeCategory(index);
                  },
                  child: Container(
                    width: 170,
                    color: _selectedCategoryIndex == index
                        ? GameColor.purple
                        : GameColor.white,
                    child: Center(
                        child: Text(
                      'A' +
                          '-'
                              ''
                              '2' +
                          '%' +
                          "(" '3' +
                          ")",
                      style: TextStyle(
                          color: _selectedCategoryIndex == index
                              ? GameColor.white
                              : GameColor.black),
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
                          const SizedBox(
                              width: 80,
                              child: Text(
                                '7705015444',
                                style: TextStyle(color: GameColor.white,fontSize: 12),
                              )),
                          Container(
                              alignment: Alignment.center,
                              width: 80,
                              child: Text(
                                '0'.toUpperCase(),
                                style: const TextStyle(color: GameColor.white,fontSize: 12),
                              )),
                          Container(
                              alignment: Alignment.center,
                              width: 140,
                              child: const Text(
                                '22/10/24',
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
