import 'package:flutter/material.dart';
import 'package:v2ex/i10n/localization_intl.dart';
import '../classes/home/home_page.dart';
import '../classes/profile/pages/profile_page.dart';
import '../common/color_ext.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int _index = 0;
  final List<Widget> _pages = [
    const HomePage(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _index,
        children: _pages,
      ),
      bottomNavigationBar: _bottomNavigationBar()
    );
  }

  // 底部Tabbar
  Widget _bottomNavigationBar() {
    VLocalizations localization = VLocalizations.of(context);
    return BottomNavigationBar(
        elevation: 1,
        currentIndex: _index,
        selectedItemColor: C.c222222,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: localization.home
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.people),
            label: localization.profile
          )
        ],
        onTap: (value) {
          setState(() {
            _index = value;
          });
        },
      );
  }
}