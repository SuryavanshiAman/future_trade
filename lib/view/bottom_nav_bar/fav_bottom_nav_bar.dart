
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
      child:
      Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
    // Color? color = selectedIndex == index ? widget.selectedColor : widget.color;
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: GestureDetector(
          onTap: () => onPressed!(index!),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                // mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,

                children: <Widget>[
                  if (item!.icon != null)
                    item.icon!
                  else const SizedBox(),

                  if (item.text != null)
                    item.text!
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FabBottomNavBarItem {
  FabBottomNavBarItem({this.imageData,this.icon,this.text,this.style, this.color});
  String? imageData;
  Widget? icon;
  Widget? text;
  TextStyle?style;
  Color?color;
}