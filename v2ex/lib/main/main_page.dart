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
      // body: _pages[_index],
      // bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  // 底部Tabbar
  Widget _bottomNavigationBar() {
    VLocalizations localization = VLocalizations.of(context);
    return BottomNavigationBar(
      backgroundColor: C.bar(context),
        elevation: 0.5,
        currentIndex: _index,
        selectedItemColor: isDarkMode(context) ? C.c999999 : C.c222222,
        unselectedItemColor: isDarkMode(context) ? C.c666666 : C.c999999,
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