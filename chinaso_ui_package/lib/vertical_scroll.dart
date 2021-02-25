import 'dart:async';

import 'package:chinaso_ui_package/res.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VerticalScroll extends StatefulWidget {
  final List<String> arrTexts;
 // final int maxListNum;
  final Color textColor;
  final double textSize;
  final int intervalSeconds;

  VerticalScroll(
      {Key key,
        @required this.arrTexts,
      //  @required this.maxListNum,
        this.textColor = Colors.black,
        this.textSize = 15,
        this.intervalSeconds = 5}):
        assert(arrTexts != null),
//        assert(maxListNum > 0),
        super(key: key);

  /// @description: 更新数据源
  /// @param {str:添加的新消息字符串}
  /// @return {空}
//  void appendString(String str) {
//    if (str != null) {
//      arrTexts.add(str);
//    }
//    if (arrTexts.length >= maxListNum) {
//      arrTexts.removeAt(0);
//    }
//  }

  @override
  _VerticalScrollState createState() => _VerticalScrollState();
}
class _VerticalScrollState extends State<VerticalScroll> with WidgetsBindingObserver {

  GlobalKey _myKey = new GlobalKey();
  ScrollController _controller;
  int index=0;
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    //来监听 节点是否build完成
    WidgetsBinding widgetsBinding=WidgetsBinding.instance;
    widgetsBinding.addPostFrameCallback((callback){
      Timer.periodic(new Duration(seconds: 5), (timer){
        index+=_myKey.currentContext.size.height.toInt();
        _controller.animateTo((index).toDouble(), duration: new Duration(seconds: 2), curve: Curves.easeOutSine);
        //滚动到底部从头开始
        if((index-_myKey.currentContext.size.height.toInt()).toDouble()>_controller.position.maxScrollExtent){
          _controller.jumpTo(_controller.position.minScrollExtent);
          index=0;
        }
      });
    });
    _controller = new ScrollController(initialScrollOffset: 0);
    /*   _controller.addListener(() {
      print(_controller.offset);
    });*/
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        key: _myKey,
        //禁止手动滑动
        physics: new NeverScrollableScrollPhysics(),
        itemCount: widget.arrTexts.length,
        //item固定高度
        itemExtent: 30,
        scrollDirection: Axis.vertical,
        controller: _controller,
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.centerLeft,
            child: Text(widget.arrTexts[index],style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal,color: Colours.sourceColor)),
          );
        });

  }

}