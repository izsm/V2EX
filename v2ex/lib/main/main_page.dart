import 'package:flutter/material.dart';
import '../classes/home/home_page.dart';
import '../classes/profile/profile_page.dart';
import '../common/color_ext.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int _index = 0;
  final List<Widget> _pages = const [
    HomePage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _index,
        children: _pages,
      ),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  // 底部Tabbar
  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
        elevation: 1,
        currentIndex: _index,
        selectedItemColor: C.c222222,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '首页'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: '我的'
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