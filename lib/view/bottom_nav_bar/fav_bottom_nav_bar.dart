
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:future_trade/res/color-const.dart';

class FabBottomNavBar extends StatefulWidget {
  const FabBottomNavBar({
    super.key,
    this.items,
    this.height = 60.0,
    this.iconSize = 24.0,
    this.backgroundColor,
    this.color,
    this.selectedColor,
    this.notchedShape,
    this.onTabSelected,
    this.icon
  });

  final List<FabBottomNavBarItem>? items;
  final double? height;
  final double? iconSize;
  final Color? backgroundColor;
  final Color? color;
  final Color? selectedColor;
  final NotchedShape? notchedShape;
  final ValueChanged<int>? onTabSelected;
  final IconData ?icon;

  @override
  State<StatefulWidget> createState() => FabBottomNavBarState();
}
int selectedIndex = 0;
class FabBottomNavBarState extends State<FabBottomNavBar> {


  _updateIndex(int index) {
    widget.onTabSelected!(index);
    setState(() {
      selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(widget.items!.length, (int index) {
      return _buildTabItem(
        item: widget.items![index],
        index: index,
        onPressed: _updateIndex,
      );
    });
    return BottomAppBar(
      notchMargin:5,
      shape: widget.notchedShape,
      color: widget.backgroundColor,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items,
      ),
    );
  }


  Widget _buildTabItem({
    FabBottomNavBarItem? item,
    int? index,
    ValueChanged<int>? onPressed,
  }) {
    Color? color =
    selectedIndex == index ? widget.selectedColor : widget.color;
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: GestureDetector(
          onTap: () => onPressed!(index!),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (item!.icon != null)
                Icon(item.icon,color:color,)
                // Image.asset(item.imageData!, height: 25)
              else const SizedBox(),
              Text(
                item.text.toString(),
                style: TextStyle(
                    color: color,
                    fontWeight: selectedIndex == index
                        ? FontWeight.bold
                        : FontWeight.normal,fontSize: 13),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FabBottomNavBarItem {
  FabBottomNavBarItem({this.imageData,this.icon, this.color,this.text});
  String? imageData;
  IconData?icon;
  Color?color;
  String? text;
}