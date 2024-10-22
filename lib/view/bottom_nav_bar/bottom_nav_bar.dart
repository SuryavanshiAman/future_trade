import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:future_trade/main.dart';
import 'package:future_trade/res/color-const.dart';
import 'package:future_trade/utils/routes/routes_name.dart';
import 'package:future_trade/utils/utils.dart';
import 'package:future_trade/view/Home/home_screen.dart';
import 'package:future_trade/view/bottom_nav_bar/fav_bottom_nav_bar.dart';
import 'package:future_trade/view/products/my_product.dart';
import 'package:future_trade/view/profile/profile_screen.dart';
import 'package:future_trade/view/promotion/refer_earn.dart';
import 'package:future_trade/view/wallet/wallet_screen.dart';

class BottomNavBar extends StatefulWidget {
  final int initialIndex;
  const BottomNavBar({super.key, this.initialIndex = 0});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _lastSelected = 0;

  final List<Widget> _tabs = [
    const HomeScreen(),
    const MyProductScreen(),
    const ReferEarnScreen(),
    const WalletScreen(),
    const ProfileScreen(),
  ];

  void _selectedTab(int index) {
    setState(() {
      _lastSelected = index;
    });
  }

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky,
        overlays: []);
    _lastSelected = widget.initialIndex;
    super.initState();
    Future.delayed(Duration.zero, () {
      final args = ModalRoute.of(context)?.settings.arguments;
      if (args != null && args is int) {
        setState(() {
          _lastSelected = args;
        });
      }
    });
  }

  Future<bool> _onWillPop() async {
    if (_lastSelected > 0) {
      setState(() {
        _lastSelected = 0;
      });
      _selectedTab(0);
      return false;
    } else {
      return await Utils.showExitConfirmation(context) ?? false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        extendBody: true,
        body: _tabs[_lastSelected],
        bottomNavigationBar: FabBottomNavBar(
          notchedShape: const CircularNotchedRectangle(),
          color: GameColor.black,
          selectedColor: GameColor.purple,
          onTabSelected: _selectedTab,
          backgroundColor: GameColor.white,
          items: [
            FabBottomNavBarItem(
                icon: Icon(
                  _lastSelected == 0 ? Icons.home_filled : Icons.home_outlined,
                  color:
                      _lastSelected == 0 ? GameColor.purple : GameColor.black,
                ),
                text: Text(
                  'Home',
                  style: TextStyle(
                      color: _lastSelected == 0
                          ? GameColor.purple
                          : GameColor.black,
                      fontWeight: _lastSelected == 0
                          ? FontWeight.bold
                          : FontWeight.normal,
                      fontSize: 13),
                )),
            FabBottomNavBarItem(
                icon: Icon(
                  _lastSelected == 1 ? Icons.widgets : Icons.widgets_outlined,
                  color:
                      _lastSelected == 1 ? GameColor.purple : GameColor.black,
                ),
                text: Text(
                  'My Product',
                  style: TextStyle(
                      color: _lastSelected == 1
                          ? GameColor.purple
                          : GameColor.black,
                      fontWeight: _lastSelected == 1
                          ? FontWeight.w600
                          : FontWeight.normal,
                      fontSize: 12),
                )),
            FabBottomNavBarItem(
                // icon: Icon(
                //   _lastSelected == 1 ? Icons.add : Icons.widgets_outlined,
                //   color:
                //   _lastSelected == 1 ? GameColor.white : GameColor.white,
                //   size: 6,
                // ),
                text: Text(
              ' Promotion',
              style: TextStyle(
                  color:
                      _lastSelected == 2 ? GameColor.purple : GameColor.black,
                  fontWeight:
                      _lastSelected == 2 ? FontWeight.w800 : FontWeight.normal,
                  fontSize: 13),
            )),
            FabBottomNavBarItem(
                icon: Icon(
                  _lastSelected == 3 ? Icons.wallet : Icons.wallet_outlined,
                  color:
                      _lastSelected == 3 ? GameColor.purple : GameColor.black,
                ),
                text: Text(
                  'Wallet',
                  style: TextStyle(
                      color: _lastSelected == 3
                          ? GameColor.purple
                          : GameColor.black,
                      fontWeight: _lastSelected == 3
                          ? FontWeight.w600
                          : FontWeight.normal,
                      fontSize: 13),
                )),
            FabBottomNavBarItem(
                icon: Icon(
                  _lastSelected == 4 ? Icons.person : Icons.person_outline,
                  color:
                      _lastSelected == 4 ? GameColor.purple : GameColor.black,
                ),
                text: Text(
                  'Profile',
                  style: TextStyle(
                      color: _lastSelected == 4
                          ? GameColor.purple
                          : GameColor.black,
                      fontWeight: _lastSelected == 4
                          ? FontWeight.w600
                          : FontWeight.normal,
                      fontSize: 13),
                )),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.transparent,
          onPressed: () {
            setState(() {
              _selectedTab(2);
              selectedIndex = 2;
            });
          },
          elevation: 0,
          child: Container(
            height: 57,
            width: 55,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: GameColor.purple,
                image: const DecorationImage(
                    image: AssetImage("assets/images/refer.png"))),
          ),
        ),
      ),
    );
  }
}
