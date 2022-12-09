import 'package:flutter/material.dart';
import '../../widgets/base_scaffold.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const BaseScaffold(
      title: '首页',
      isShowDefaultLeftItem: false,
      body: Text('data'),
    );
  }
}