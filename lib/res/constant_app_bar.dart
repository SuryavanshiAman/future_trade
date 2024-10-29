
import 'package:flutter/material.dart';
import 'package:future_trade/main.dart';
class ConstantAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final Widget? title;
  final bool? centerTitle;
  final List<Widget>? actions;
  final Gradient? gradient;
  final double? toolbarHeight;
  final double? leadingWidth;
  final double? elevation;
  final Color?color;

  const ConstantAppBar({
    super.key,
    this.leading,
    this.title,
    this.centerTitle,
    this.actions,
    this.gradient,
    this.toolbarHeight,
    this.leadingWidth,
    this.elevation,
    this.color
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color: color??GameColor.blue,
        gradient: LinearGradient(
          colors: [
            Color(0xFF56CCF2), Color(0xFF2F80ED)],

          begin: Alignment.topLeft,
          end: Alignment.bottomRight
        )
      ),
      child: AppBar(
        leadingWidth: leadingWidth??width*0.18,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: elevation??0,
        leading: leading,
        title: title ?? const Text(''),
        actions: actions,
        centerTitle: centerTitle ?? false,
        toolbarHeight: toolbarHeight, // Pass the toolbarHeight to AppBar
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight ?? kToolbarHeight);
}