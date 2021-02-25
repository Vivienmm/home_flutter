import 'dart:convert';

import 'package:chinaso_http_package/log_error.dart';
import 'package:chinaso_ui_package/vertical_scroll.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_flutter/generated/json/hot_news_entity_helper.dart';
import 'package:home_flutter/http/api_service.dart';
import 'package:home_flutter/http/hot_news_entity.dart';

class BarDelegate extends SliverPersistentHeaderDelegate {

  List<String> hotWords=new List<String>();



  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {

    hotWords.add("热词1");
    hotWords.add("热词2");
    hotWords.add("热词3");

    return
      Container(
      height: 50,
      width: double.infinity,
      margin: EdgeInsets.only(left:10,right:10,bottom: 10),
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
    );
  }

  Color makeStickyHeaderTextColor(shrinkOffset, isIcon) {
    if(shrinkOffset <= 50) {
      return isIcon ? Colors.white : Colors.transparent;
    } else {
      final int alpha = (shrinkOffset / (this.maxExtent - this.minExtent) * 255).clamp(0, 255).toInt();
      return Color.fromARGB(alpha, 0, 0, 0);
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

  Future getHotWords (){

    /// 调用
    ApiInterface.getHotNews() .then((data) {
      /// 请求成功 进行成功的逻辑处
      Map<String, dynamic> responseData =  jsonDecode(data);

      Map<String, dynamic> responseDataInner =  jsonDecode(jsonEncode(responseData["data"] as List));
      List<HotNewsEntity> hots=new List<HotNewsEntity>();


      ((responseData["data"])as List).forEach((v) {

        HotNewsEntity num=new HotNewsEntity();
        hotNewsEntityFromJson(num, jsonDecode(jsonEncode(v)));
        hots.add(num);
        //  listums.add(new CityListum().fromJson(v));
      });


    }).catchError((errorMsg) {
      /// 请求失败 dio异常

      /// 请求失败  进入了自定义的error拦截
      if (errorMsg is LogicError) {
        LogicError logicError = errorMsg;

      } else {

      }
    });
  }
}