import 'package:flutter/material.dart';
import 'package:v2ex/common/adapt.dart';
import 'package:v2ex/common/color_ext.dart';
import 'package:v2ex/i10n/localization_intl.dart';
import 'package:v2ex/widgets/base_scaffold.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {

  List<String> _datas = [];

  _createDatas(BuildContext context) {
    VLocalizations localization = VLocalizations.of(context);
    _datas = [
      localization.languageSetting,
      localization.cache
    ];
  }

  @override
  Widget build(BuildContext context) {
    _createDatas(context);
    return BaseScaffold(
      title: VLocalizations.of(context).setting,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _datas.length,
              itemExtent: 44.fit,
              itemBuilder: (context, index) {
                return _cell(index);
            })
          ),
          GestureDetector(
            onTap: () {
              
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 60.fit),
              width: Adapt.width - 60.fit,
              height: 44.fit,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: C.list(context)
              ),
              child: Center(
                child: Text(VLocalizations.of(context).exitLogin, style: TextStyle(color: C.title(context), fontSize: 15.fit)),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _cell(int index) {
    return GestureDetector(
      onTap: () => _cellTap(index),
      child: Container(
        padding: EdgeInsets.only(left: 15.fit),
        color: C.list(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 0), 
                          child: Text(_datas[index], style: TextStyle(color: C.title(context), fontSize: 15.fit))
                        )
                      ],
                    )
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10.fit), 
                    child: Icon(Icons.arrow_forward_ios, size: 18.fit, color: C.c999999)
                  )
                ],
              )
            ),
            Divider(color: C.line(context), height: 0.5)
          ],
        )
      ),
    );
  }

  _cellTap(int index) {
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/language');
        break;
      case 1:
        break;
      case 2:
        break;
      case 3:
        break;
      default:
        break;
    }
  }
}