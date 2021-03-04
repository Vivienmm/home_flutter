import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// * @author Suyw
/// * @description:
/// * @date :2021/3/3
 class BottomMenu extends StatelessWidget{
   List<String> nameItems = <String>[
     '添加收藏',
     '收藏列表',
     '复制链接',
     '刷新',
   ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 250.0,
      child: new Column(
        children: <Widget>[
          new Padding(
            padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: new Container(
              height: 190.0,
              child: new GridView.builder(
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 5.0,
                    childAspectRatio: 1.0),
                itemBuilder: (BuildContext context, int index) {
                  return new Column(
                    children: <Widget>[
                      new Padding(
                          padding: EdgeInsets.fromLTRB(0.0, 6.0, 0.0, 6.0),
                          child: Icon(
                            Icons.ac_unit,
                            size: 50,
                          )),
                      new Text(nameItems[index])
                    ],
                  );
                },
                itemCount: nameItems.length,
              ),
            ),
          ),
          new Container(
            height: 0.5,
            color: Colors.blueGrey,
          ),
          new Center(
            child: new Padding(
              padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
              child: GestureDetector(
                  onTap:(){
                    Navigator.of(context).pop();
                  },
                  child: new Text(
                    '取  消',
                    style: new TextStyle(fontSize: 18.0, color: Colors.blueGrey),
                  )),
            ),
          ),
        ],
      ),
    );
  }
   
 }