
/*
 * @Author: xuanwenchao  WX:x678939
 * @Date: 2020-12-07 11:30:51
 * @LastEditTime: 2020-12-09 10:54:47
 * @LastEditors: Please set LastEditors
 * @Description: 单行无限循环滚动消息文本显示组件
 * @FilePath: /demo1/lib/app/conponent/scrolltext.dart
 */

import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// @ScrollText Widget
/// @param {arrTexts: 初始化消息文本列表}
/// @param {maxListNum: 最多展示消息的数量，超出自动删除最早的消息、FIFO}
/// @param {textColor: 滚动消息的文本颜色, 默为黑色}
/// @param {textSize: 滚动消息的文本字体大小, 默为15}
/// @param {intervalSeconds: 滚动消息间隔秒数, 默为5}
/// @return {空}
class VerticalScrollText extends StatefulWidget {
  final List<String> arrTexts;
  final int maxListNum;
  final Color textColor;
  final double textSize;
  final int intervalSeconds;

  VerticalScrollText(
      {Key key,
        @required this.arrTexts,
        @required this.maxListNum,
        this.textColor = Colors.black,
        this.textSize = 15,
        this.intervalSeconds = 5})
      : assert(arrTexts != null),
        assert(maxListNum > 0),
        super(key: key);

  /// @description: 更新数据源
  /// @param {str:添加的新消息字符串}
  /// @return {空}
  void appendString(String str) {
    if (str != null) {
      arrTexts.add(str);
    }
    if (arrTexts.length >= maxListNum) {
      arrTexts.removeAt(0);
    }
  }

  @override
  _VerticalScrollTextState createState() => _VerticalScrollTextState();
}

class _VerticalScrollTextState extends State<VerticalScrollText> {
  ScrollController _controller;
  Timer _timer;
  double _oldOffset = 0.0;
  Duration _dur = Duration(microseconds: 100);

  @override
  void initState() {
    super.initState();
    try {
      _dur = Duration(seconds: widget.intervalSeconds);
      _controller = ScrollController(initialScrollOffset: _oldOffset);
      _timer = Timer.periodic(_dur, (timer) {
        double newOffset = _controller.offset + 200;
        if (newOffset != _oldOffset) {
          _oldOffset = newOffset;
          _controller.animateTo(_oldOffset,
              duration: _dur, curve: Curves.linear); // 线性曲线动画
        }
      });
    } catch (e) {
      print("ScrollText:initState Error:${e.toString()}");
    }
  }

  //组件销毁处理
  @override
  void dispose() {
    _timer.cancel();
    _controller.dispose();
    super.dispose();
  }

  //将多个Text Widget 排列为一行来显示
  Widget _child() {
    return new Row(children: _children());
  }

  /// @用所有字符串分别生成包含Text组件的widget数组
  /// @param {*}
  /// @return {widget数组}
  List<Widget> _children() {
    List<Widget> items = [];
    try {
      for (var i = 0; i < widget.arrTexts.length; i++) {
        Container item = new Container(
          margin: new EdgeInsets.only(right: 50),
          child: Text(widget.arrTexts[i],
              style: TextStyle(
                  color: widget.textColor, fontSize: widget.textSize)),
        );
        items.add(item);
      }
    } catch (e) {
      print("_children Error:${e.toString()}");
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical, // 横向滚动
      controller: _controller, // 滚动的controller
      itemBuilder: (context, index) {
        return _child();
      },
    );
  }
}
