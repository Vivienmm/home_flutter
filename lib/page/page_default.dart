// 页面内容
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageContent extends StatelessWidget {
  PageContent({Key key, this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        this.title,
        style: TextStyle(
          color: Colors.pink,
          fontSize: 60,
        ),
      ),
    );
  }
}