import 'package:flutter/material.dart';
import 'ui_navigation_bar.dart';
import '../common/color_ext.dart';

class BaseScaffold extends StatefulWidget {

  final String? title;
  final Widget? titleWidget;
  final Widget? leftItem;
  final List<Widget>? rightItems;
  final Widget? body;
  final bool isShowDefaultLeftItem;

  const BaseScaffold({
    Key? key, 
    this.title, 
    this.titleWidget,
    this.leftItem,
    this.rightItems,
    this.body,
    this.isShowDefaultLeftItem = true,
    }) : super(key: key);

  @override
  State<BaseScaffold> createState() => _BaseScaffoldState();
}

class _BaseScaffoldState extends State<BaseScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: C.background,
      appBar: UINavigationBar(
        title: widget.title,
        titleWidget: widget.titleWidget,
        leftItem: widget.leftItem,
        rightItems: widget.rightItems,
        isShowDefaultLeftItem: widget.isShowDefaultLeftItem,
      ),
      body: widget.body,
    );
  }
}