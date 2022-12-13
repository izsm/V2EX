import 'package:flutter/material.dart';
import 'package:v2ex/i10n/localization_intl.dart';
import '../../widgets/base_scaffold.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    VLocalizations? localization = VLocalizations.of(context);
    return BaseScaffold(
      title: localization.home,
      isShowDefaultLeftItem: false,
      body: const Text('data'),
    );
  }
}