import 'package:flutter/material.dart';
import 'package:v2ex/i10n/localization_intl.dart';
import 'package:v2ex/widgets/base_scaffold.dart';
import '../../../common/color_ext.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    VLocalizations localization = VLocalizations.of(context);
    return BaseScaffold(
      title: localization.profile,
      isShowDefaultLeftItem: false,
      body: Center(
        child: TextButton(
          child: Text(localization.languageSetting, style: TextStyle(color: C.c666666),),
          onPressed: () { 
            Navigator.pushNamed(context, '/language');
          },
        ),
      ),
    );
  }
}