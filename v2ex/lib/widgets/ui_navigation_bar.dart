import 'package:flutter/material.dart';
import '../common/color_ext.dart';

class UINavigationBar extends StatefulWidget implements PreferredSizeWidget {

  final String? title;
  final Widget? titleWidget;
  final bool centerTitle;
  final double elevation;
  final Color backgroundColor;
  final bool isShowDefaultLeftItem;
  final Widget? leftItem;
  final List<Widget>? rightItems;
  final PreferredSizeWidget? tabs;

  UINavigationBar({
    Key? key, 
    this.title, 
    this.titleWidget,
    this.centerTitle = true,
    this.elevation = 0.5,
    this.backgroundColor = Colors.white,
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
  void initState() {
    super.initState();
    if (widget.title != null) {
      title = Text(
        widget.title!, 
        style: TextStyle(color: C.c222222, fontSize: 16)
      );
    }
    if (widget.titleWidget != null) {
      title = widget.titleWidget;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      centerTitle: widget.centerTitle,
      elevation: widget.elevation,
      backgroundColor: widget.backgroundColor,
      leading: widget.isShowDefaultLeftItem ? widget.leftItem ?? defaultBack() : null,
      actions: widget.rightItems,
      bottom: widget.tabs,
      toolbarHeight: 44,
    );
  }

  Widget defaultBack() {
    return GestureDetector(
      child: Icon(
        Icons.arrow_back_ios,
        color: C.c222222,
      ),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}