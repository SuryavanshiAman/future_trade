import 'dart:convert';


import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:future_trade/res/color-const.dart';
import 'package:http/http.dart' as http;

class SliderPage extends StatefulWidget {
  const SliderPage({Key? key}) : super(key: key);

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 150,
            aspectRatio: 16/9,
            viewportFraction: 0.9,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
            scrollDirection: Axis.horizontal,
          ),
          items: state_data.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(

                    width: MediaQuery.of(context).size.width,
                    // margin: const EdgeInsets.symmetric(horizontal: 2.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      // border: Border.all(width: 2,color: lightBlue),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(i)
                      )
                    ),

                );
              },
            );
          }).toList(),
        ),
        Padding(
          padding:  EdgeInsets.only(top: height*0.19),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: state_data.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => setState(() => _currentIndex = entry.key),
                child: Container(
                  width: 8.0,
                  height: 8.0,
                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                        ? GameColor.gray
                        : GameColor.white)
                        .withOpacity(_currentIndex == entry.key ? 0.9 : 0.4),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
  @override
  void initState() {
    // state();
    super.initState();
  }

  List<String> state_data = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRs39HZSVdNk4sipuGJ10Ebwajwcq03xrqz_A&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1Dw7-4lVfRq74_YEiPEt4e-bQ0_6UA2y73Q&s"
  ];

  // Future<String> state() async {
  //   final res = await http.get(
  //       Uri.parse(ApiConst.sliderUrl)
  //   );
  //   final resBody = json.decode(res.body)['data'];
  //   print("hhhhhhhhhhhhh");
  //   print(resBody);
  //   setState(() {
  //     state_data = resBody;
  //   });
  //
  //
  //
  //   return "Sucess";
  // }
}
