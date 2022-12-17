import 'package:flutter/material.dart';
import 'package:v2ex/classes/profile/pages/profile_%20sliver_top_bar.dart';
import 'package:v2ex/common/adapt.dart';
import 'package:v2ex/i10n/localization_intl.dart';
import '../../../common/color_ext.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with TickerProviderStateMixin {
  //初始化要加载到图片上的高度
  double _extraPicHeight = 0;
  //前一次手指所在处的y值
  late double _prevDy;
  late AnimationController _animationController;
  late Animation<double> _anim;
  
  List<String> _datas = [];

  @override
  void initState() {
    super.initState();
    _prevDy = 0;
    _animationController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    _anim = Tween(begin: 0.0, end: 0.0).animate(_animationController);
  }

  _createDatas(BuildContext context) {
    VLocalizations localization = VLocalizations.of(context);
    _datas = [
      localization.accountBalance,
      localization.post,
      localization.theme,
      localization.collection,
      localization.follow,
      localization.recentBrowsing,
      localization.setting
    ];
  }

  @override
  Widget build(BuildContext context) {
    _createDatas(context);
    return Scaffold(
      backgroundColor: C.background(context),
      body: Listener(
        // 手指的移动时
        onPointerMove: (event) {
          _updatePicHeight(event.position.dy);
        },
        // 当手指抬起离开屏幕时
        onPointerUp: (event) {
          _runAnimate();
          // 重置动画
          _animationController.forward(from: 0);
        },
        child: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [
            SliverAppBar(
              toolbarHeight: 0,
              centerTitle: true,
              backgroundColor: C.bar(context),
              elevation: 0.5,
              // floating代表是否会发生下拉立即出现SliverAppBar
              floating: false,
              // pinned代表是否会在顶部保留AppBar
              pinned: false,
              // snap必须与floating:true联合使用，表示显示SliverAppBar之后，如果没有完全拉伸，是否会完全神展开
              snap: false,
              expandedHeight: 200.fit+_extraPicHeight,//顶部控件所占的高度,跟随因手指滑动所产生的位置变化而变化。
              flexibleSpace: FlexibleSpaceBar(
                background: ProfileSliverTopBar(extraPicHeight: 200.fit+_extraPicHeight)
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, i) {
                  return _cell(i);
                },
                childCount: _datas.length,
                addAutomaticKeepAlives: false
              )
            )
          ],
        ),
      )
    );
  }

  Widget _cell(int index) {
    return GestureDetector(
      onTap: () => _cellTap(index),
      child: Container(
        padding: EdgeInsets.only(left: 15.fit),
        color: C.list(context),
        height: 44.fit,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        // 账户余额
                        // Icon(Icons.monetization_on, color: C.title(context)),
                        // 设置
                        // Icon(Icons.settings, color: C.title(context)),
                        // 最近浏览
                        // Icon(Icons.history, color: C.title(context)),
                        // 发布
                        // Icon(Icons.publish, color: C.title(context)),
                        // 关注
                        // Icon(Icons., color: C.title(context)),
                        
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

  _updatePicHeight(double changed) {
    // 如果是手指第一次点下时，我们不希望图片大小就直接发生变化，所以进行一个判定。
    if(_prevDy == 0) {
      _prevDy = changed;
    }
    // 新的一个y值减去前一次的y值然后累加，作为加载到图片上的高度。
    _extraPicHeight += (changed - _prevDy);
    setState(() {//更新数据
      _extraPicHeight = _extraPicHeight;
    });
    _prevDy = changed;
  }

  // 设置动画让extraPicHeight的值从当前的值渐渐回到 0
  _runAnimate() {
    _anim = Tween(begin: _extraPicHeight, end: 0.0).animate(_animationController);
    _anim.addListener((){
      setState(() {
        _extraPicHeight = _anim.value;
      });
    });
    // 同样归零
    _prevDy = 0;
  }

  _cellTap(int index) {
    switch (index) {
      case 0:
        break;
      case 1:
        break;
      case 2:
        break;
      case 3:
        break;
      case 4:
        break;
      case 5:
        break;
      case 6:
        Navigator.pushNamed(context, '/setting');
        break;
      default:
        break;
    }
  }
}