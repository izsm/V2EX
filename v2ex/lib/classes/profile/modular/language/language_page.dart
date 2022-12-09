import 'package:flutter/material.dart';
import 'package:v2ex/widgets/ui_navigation_bar.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UINavigationBar(
        title: '语言切换',
      ),
    );
  }
}