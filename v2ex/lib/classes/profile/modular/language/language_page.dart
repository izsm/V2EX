import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v2ex/common/localized.dart';
import 'package:v2ex/i10n/localization_intl.dart';
import 'package:v2ex/widgets/base_scaffold.dart';
import 'package:v2ex/common/color_ext.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {

  // 选择的语言
  String _selectLocale = '';
  late Localized _localeModel;
  late VLocalizations _localization;
  List<Locale> _supportedLocales = [];

  @override
  Widget build(BuildContext context) {
    _localeModel = Provider.of<Localized>(context);
    if (_selectLocale.isEmpty) {
      _selectLocale = _localeModel.locale;
    }
    _localization = VLocalizations.of(context);
    _supportedLocales = _localeModel.supportedLocales;
    return BaseScaffold(
      title: _localization.languageSetting,
      rightItems: _navRightItems(),
      body: _content(),
    );
  }

  List<Widget> _navRightItems() {
    return [
      Padding(
        padding: const EdgeInsets.only(right: 15),
        child: _selectLocale == _localeModel.locale ? null : Center(
          child: GestureDetector(
            child: Text(_localization.confirm, style: TextStyle(color: C.c222222, fontSize: 15)),
            onTap: () {
              _localeModel.change = _selectLocale;
            },
          ),
        )
      )
    ];
  }

  Widget _content() {
    return ListView.builder(
      itemCount: _supportedLocales.length,
      itemExtent: 44,
      itemBuilder: ((context, index) {
        return GestureDetector(
          child: Container(
            color: Colors.white,
              padding: const EdgeInsets.only(left: 15),
              child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          _localeModel.dispalyName(_supportedLocales[index].toString()), 
                          style: TextStyle(color: C.c222222, fontSize: 15)
                        )
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15), 
                        child: _selectLocale == _supportedLocales[index].toString() ? Icon(Icons.check, size: 20, color: C.c222222) : null
                      )
                    ],
                  ),
                ),
                Divider(color: C.line, height: 0.5,)
              ]
            )
          ),
          onTap: () {
            setState(() {
              _selectLocale = _supportedLocales[index].toString();
            });
          },
        );
      })
    );
  }
}