import 'dart:convert';


import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:future_trade/main.dart';
import 'package:future_trade/res/api_url.dart';
import 'package:future_trade/res/color-const.dart';
import 'package:future_trade/view_model/banner_view_%20model.dart';
import 'package:provider/provider.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({Key? key}) : super(key: key);

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  int _currentIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<BannerViewModel>(context,listen: false).bannerApi(context);
  }
  @override

  Widget build(BuildContext context) {
   final banner= Provider.of<BannerViewModel>(context).bannerResponse;
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
          items: (banner?.data??[]).map((i) {
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
                        image: NetworkImage("${ApiUrl.imageUrl}${i.slider1.toString()}")
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
            children: (banner?.data??[]).asMap().entries.map((entry) {
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

  List<String> state_data = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRs39HZSVdNk4sipuGJ10Ebwajwcq03xrqz_A&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1Dw7-4lVfRq74_YEiPEt4e-bQ0_6UA2y73Q&s"
  ];

}
