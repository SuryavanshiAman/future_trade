import 'package:flutter/material.dart';
import 'package:future_trade/main.dart';
import 'package:future_trade/res/color-const.dart';
import 'package:future_trade/res/constant_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _customTileExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GameColor.black,
      appBar: ConstantAppBar(
        centerTitle: true,
        title: Image.asset(
          "assets/images/future_trade_logo.png",
          scale: 1.2,
        ),
        actions: [
          const Icon(
            Icons.wallet,
            color: GameColor.white,
          ),
          SizedBox(
            width: width * 0.02,
          )
        ],
      ),
      body: ListView(
        children: [
          ExpansionTile(
            leading:CircleAvatar(
      radius: 22,
        backgroundImage:AssetImage('assets/images/user.gif') ,
      ),
            title:Text("Aman Chauhan",
        style:  TextStyle(
          color: GameColor.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
            subtitle: Text("2356",
                style:  TextStyle(
                  color: GameColor.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                )),
            trailing:
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(height: height*0.01,),
                Text("Downline Details",
                    style:  TextStyle(
                      color: GameColor.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    )),
                Icon(
                  _customTileExpanded
                      ? Icons.arrow_drop_down_circle
                      : Icons.arrow_drop_down,color: GameColor.white,
                ),
              ],
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2, // 3 items per row
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio:
                      2.5, // Adjust as needed for the aspect ratio
                  physics:
                      const NeverScrollableScrollPhysics(), // Disable grid scroll, as ListView will handle it
                  children: [
                    _buildGridTile("3", "Active Downline"),
                    _buildGridTile("9250.00", "Cashback Income"),
                    _buildGridTile("7500.00", "Team Income"),
                    _buildGridTile("15700.00", "Total Payout"),
                    _buildGridTile("0.00", "Team Reward Income"),
                    _buildGridTile("0.00", "Today Team Business"),
                    _buildGridTile("16750.00", "Total Income"),
                    _buildGridTile("0.00", "Income Wallet"),]
                ),
              ),
            ],
        onExpansionChanged: (bool expanded) {
          setState(() {
            _customTileExpanded = expanded;
          });}
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderTile(String amount, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          amount,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildGridTile(String amount, String label) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            // colors: [Color(0xFF000000),
            //   Color(0xFF2d2f30)],
            colors: [
              Colors.blue.shade300,
              Colors.blue.shade600,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
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
                radius: 22,
                backgroundImage:AssetImage('assets/images/user.gif') ,
              ),
              Column(
               crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SizedBox(height: 8),
                  Text(
                    amount,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  // SizedBox(height: 8),
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
}
