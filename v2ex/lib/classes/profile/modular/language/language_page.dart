import 'package:flutter/material.dart';
import 'package:v2ex/widgets/base_scaffold.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  @override
  Widget build(BuildContext context) {
    return const BaseScaffold(
      title: '语言切换',
      body: Center(),
    );
  }
}