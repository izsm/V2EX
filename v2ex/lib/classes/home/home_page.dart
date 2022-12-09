import 'package:flutter/material.dart';
import 'package:v2ex/widgets/ui_navigation_bar.dart';
import '../../common/color_ext.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: C.background,
      appBar: UINavigationBar(
        title: '首页',
        isShowDefaultLeftItem: false,
      ),
    );
  }
}