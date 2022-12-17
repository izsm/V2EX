// ignore_for_file: file_names

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:v2ex/common/adapt.dart';
import 'package:v2ex/common/color_ext.dart';

class ProfileSliverTopBar extends StatelessWidget {

  const ProfileSliverTopBar({Key? key, required this.extraPicHeight}) : super(key: key);
  //传入的加载到图片上的高度
  final double extraPicHeight;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      fit: StackFit.expand,
      children: <Widget>[
        SizedBox(//缩放的图片
          width: Adapt.width,
          height: extraPicHeight <= 0 ? 0 : extraPicHeight,
          child: Image.asset("resource/images/placeholder.png", fit: BoxFit.cover)
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
          child: Container(
            height: Adapt.width,
            width: extraPicHeight <= 0 ? 0 : extraPicHeight,
            decoration: BoxDecoration(
              color: C.list(context).withOpacity(0.5)
            ),
          ),
        ),
        Positioned(
          top: extraPicHeight/2-30,
          child: Column(
            children: const [
              SizedBox(
                width: 60,
                height: 60,
                child: CircleAvatar(
                  backgroundImage: AssetImage('resource/images/placeholder.png'),
                ),
              ),
              Text('izhangshumeng')
            ],
          ),
        )
      ],
    );
  }
}