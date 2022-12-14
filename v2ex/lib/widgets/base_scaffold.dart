import 'package:flutter/material.dart';
import 'package:v2ex/common/color_ext.dart';
import 'ui_navigation_bar.dart';

class BaseScaffold extends StatefulWidget {

  final String? title;
  final Widget? titleWidget;
  final Widget? leftItem;
  final List<Widget>? rightItems;
  final Widget? body;
  final bool isShowDefaultLeftItem;
  // content color
  final Color? backgroundColor;

  const BaseScaffold({
    Key? key, 
    this.title, 
    this.titleWidget,
    this.leftItem,
    this.rightItems,
    this.body,
    this.isShowDefaultLeftItem = true,
    this.backgroundColor
    }) : super(key: key);

  @override
  State<BaseScaffold> createState() => _BaseScaffoldState();
}

class _BaseScaffoldState extends State<BaseScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.backgroundColor ?? C.background(context),
      appBar: UINavigationBar(
        title: widget.title,
        titleWidget: widget.titleWidget,
        leftItem: widget.leftItem,
        rightItems: widget.rightItems,
        isShowDefaultLeftItem: widget.isShowDefaultLeftItem,
        backgroundColor: widget.backgroundColor,
      ),
      body: widget.body,
    );
  }
}