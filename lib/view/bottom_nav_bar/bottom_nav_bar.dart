import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  const BottomNavBar({super.key, this.initialIndex=0});

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
    _lastSelected=widget.initialIndex;
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
        _lastSelected=0;
      });
      return false;
    } else {
      return  await Utils.showExitConfirmation(context)?? false;
    }
  }

  @override
  Widget build(BuildContext context) {
    // context.read<ProfileProvider>().fetchProfileData();
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        extendBody: true,
        body: _tabs[_lastSelected],
        bottomNavigationBar: FabBottomNavBar(
          notchedShape: const CircularNotchedRectangle(),
          color: GameColor.black,
          selectedColor:GameColor.purple,
          onTabSelected: _selectedTab,
          backgroundColor: GameColor.white,
          items: [
            FabBottomNavBarItem(
              icon:  _lastSelected == 0 ?Icons.home_filled:Icons.home_outlined,
                text: 'Home'
            ),
            FabBottomNavBarItem(
                icon: _lastSelected ==1  ?Icons.widgets:Icons.widgets_outlined,
                text: 'My Product'
            ),
            FabBottomNavBarItem(
                text: '\n Promotion'
            ),
            FabBottomNavBarItem(
                icon: _lastSelected == 3 ?Icons.wallet:Icons.wallet_outlined,
                text: 'Wallet'
            ),
            FabBottomNavBarItem(
                icon:  _lastSelected == 4 ?Icons.person:Icons.person_outline,
                text: 'Profile'
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.transparent,
          onPressed: () {
            setState(() {
              _selectedTab(2);
              selectedIndex=2;
            });
          },
          elevation: 0,
          child:
          Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: GameColor.purple,
                image: const DecorationImage(image: AssetImage("assets/images/refer.png"))

              ),
              // child:  Image.asset("assets/images/refer.png",scale: 4,)
          ),
        ),
      ),
    );
  }
}

class FeedbackProvider {
  static void navigateToHome(BuildContext context) {
    Navigator.pushNamed(context, RoutesName.bottomNavBar,arguments: 0);
  }
  static void navigateToActivity(BuildContext context) {
    Navigator.pushNamed(context, RoutesName.bottomNavBar,arguments: 1);
  }
  static void navigateToPromotion(BuildContext context) {
    Navigator.pushNamed(context, RoutesName.bottomNavBar,arguments: 2);
  }
  static void navigateToWallet(BuildContext context) {
    Navigator.pushNamed(context, RoutesName.bottomNavBar,arguments: 3);
  }
  static void navigateToAccount(BuildContext context) {
    Navigator.pushNamed(context, RoutesName.bottomNavBar,arguments: 4);
  }
}

class GradientTextview extends StatelessWidget {
  const GradientTextview(
      this.text, {
        super.key,
        required this.gradient,
        this.style,
      });

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}
class NavigatorService {
  static void navigateToScreenThree(BuildContext context) {
    Navigator.of(context).pop();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
          builder: (context) => const BottomNavBar(initialIndex: 3)),
    );
  }
}