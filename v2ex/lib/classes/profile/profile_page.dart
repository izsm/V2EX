import 'package:flutter/material.dart';
import '../../widgets/ui_navigation_bar.dart';
import '../../common/color_ext.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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