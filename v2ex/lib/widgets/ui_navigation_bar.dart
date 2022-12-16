import 'package:flutter/material.dart';
import '../common/color_ext.dart';
import 'package:v2ex/common/adapt.dart';

class UINavigationBar extends StatefulWidget implements PreferredSizeWidget {

  final String? title;
  final Widget? titleWidget;
  final bool centerTitle;
  final Color? backgroundColor;
  final double elevation;
  final bool isShowDefaultLeftItem;
  final Widget? leftItem;
  final List<Widget>? rightItems;
  final PreferredSizeWidget? tabs;

  UINavigationBar({
    Key? key, 
    this.title, 
    this.titleWidget,
    this.centerTitle = true,
    this.backgroundColor,
    this.elevation = 0.5,
    this.isShowDefaultLeftItem = true,
    this.leftItem,
    this.rightItems,
    this.tabs,
    }) :
      preferredSize = Size.fromHeight(44 + (tabs?.preferredSize.height ?? 0.0)),
      super(key: key);
     
  @override
  final Size preferredSize;

  @override
  State<UINavigationBar> createState() => _UINavigationBarState();
}

class _UINavigationBarState extends State<UINavigationBar> {

  Widget? title;

  @override
  Widget build(BuildContext context) {
    if (widget.title != null) {
      title = Text(
        widget.title!, 
        style: TextStyle(color: C.title(context), fontSize: 16.fit, fontWeight: FontWeight.bold)
      );
    }
    if (widget.titleWidget != null) {
      title = widget.titleWidget;
    }
    
    return AppBar(
      title: title,
      centerTitle: widget.centerTitle,
      elevation: widget.elevation,
      leading: widget.isShowDefaultLeftItem ? widget.leftItem ?? defaultBack() : null,
      actions: widget.rightItems,
      bottom: widget.tabs,
      toolbarHeight: 44,
      shadowColor: C.line(context),
      backgroundColor: widget.backgroundColor ?? C.bar(context),
    );
  }

  Widget defaultBack() {
    return GestureDetector(
      child: Icon(
        Icons.arrow_back_ios,
        color: isDarkMode(context) ? C.c999999 : C.c222222,
      ),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}