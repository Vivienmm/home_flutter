

import 'package:chinaso_ui_package/widget/vertical_scroll.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class BarDelegate extends SliverPersistentHeaderDelegate {

  List<String> hotWords=new List<String>();

  BarDelegate({
    Key key,
    this.hotWords,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {

    if(hotWords.length<1){
      hotWords.add("搜新闻 上国搜");
    }
    return Container(
      height: 50,
      width: 260,
      decoration: new BoxDecoration(
        color: Colors.white,
      ),
      margin: EdgeInsets.only(left:10,right:10,bottom: 10),
      child:Row(
        children: [
          Container(
            width: isShow(shrinkOffset),
            child:Image(image:AssetImage("assets/zhong_icon.png")),

            ) ,
    Expanded(

          child:Container(
            height: 50,
            width: 260,
            padding: EdgeInsets.only(left: 15, right: 15),
            decoration: new BoxDecoration(

              image: new DecorationImage(

                image: new AssetImage('assets/input_bg.png'),
                //这里是从assets静态文件中获取的，也可以new NetworkImage(）从网络上获取
                centerSlice: new Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
              ),
            ),

            child: Row(

              children: <Widget>[
                Container(
                  height: 30,
                  width: 230,
                  child:VerticalScroll(
                    arrTexts:hotWords,
                  ) ,
                ),

                SizedBox(
                  width: 15,
                ),

                Flexible(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.centerRight,

                    child: Container(
                      width: 15,
                      height: 24,
                      child: Image.asset(
                          'assets/voice_symbol.png'
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ) ,
    ),],
      ),

    );

  }

  double isShow(double shrinkOffset) {
    if(shrinkOffset <= 50) {
      return 1;
    } else {
      return 30;
    }
  }

  @override
  double get maxExtent => 58;

  @override
  double get minExtent => 55;


  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }


}
