
import 'dart:convert';

import 'package:chinaso_http_package/log_error.dart';
import 'package:chinaso_ui_package/widget/refresh_indicator.dart';

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:home_flutter/generated/json/hot_news_entity_helper.dart';
import 'package:home_flutter/http/api_service.dart';
import 'package:home_flutter/http/hot_news_entity.dart';
import 'package:home_flutter/page/page_feed.dart';
import 'package:home_flutter/page/page_setting.dart';
import 'package:home_flutter/ui/search_bar_delegate.dart';
import 'package:weather/weather.dart';

import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
   int pageNo=0;
  List<String> hotWords=new List<String>();
  var _scrollController = ScrollController();
  var _showBackTop = false;


  Future getHotWords (){

    /// 调用
    ApiInterface.getHotNews() .then((data) {
      /// 请求成功 进行成功的逻辑处
      Map<String, dynamic> responseData =  jsonDecode(data);
      List<String> hots=new List<String>();

      ((responseData["data"])as List).forEach((v) {
        HotNewsEntity num=new HotNewsEntity();

        hotNewsEntityFromJson(num, jsonDecode(jsonEncode(v)));
        print("hot-"+num.eventName);
        hots.add(num.eventName);
        //  listums.add(new CityListum().fromJson(v));
      });
      setState(() {
        hotWords.addAll(hots);
      });


    }).catchError((errorMsg) {
      /// 请求失败 dio异常

      /// 请求失败  进入了自定义的error拦截
      if (errorMsg is LogicError) {
        LogicError logicError = errorMsg;
        print("hot-"+logicError.toString());
      } else {

      }
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHotWords ();
    // 对 scrollController 进行监听
    _scrollController.addListener(() {
      // _scrollController.position.pixels 获取当前滚动部件滚动的距离
      // window.physicalSize.height 获取屏幕高度
      // 当滚动距离大于 800 后，显示回到顶部按钮
      if(_scrollController.position.pixels >= 100&&!_showBackTop){
        setState(() {
          _showBackTop=true;
        });
      }
   //   setState(() => _showBackTop = _scrollController.position.pixels >= 800);
    });
  }
  @override
  Widget build(BuildContext context) {

      return Scaffold(
        backgroundColor: Colors.white,

        body: RefreshIndicator2(
          notificationPredicate: (notifation) {
            return true;
          },
          onRefresh: () {
            return Future.delayed(Duration(seconds: 2), () {
              return true;
            });
          },
          child: NestedScrollView(
              key: UniqueKey(),
            headerSliverBuilder: (contex, _) {
              return [
                //sliver
                SliverToBoxAdapter(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 15),
                    padding: EdgeInsets.only(top: 15, bottom: 15, left: 15),
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[

                            Container(
                              width: 180,
                              height: 70,
                              child: WeatherHome(),
                            ),
                            Flexible(
                              flex: 1,
                              child: Align(
                                alignment: Alignment.topRight,

                                child:  InkWell(
                                  onTap: (){
                                      print("点击了 ");

                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingPage()));
                                     },
                                  child: Container(
                                    width: 15,
                                    height: 15,
                                    margin: EdgeInsets.only(right: 15),
                                    child: Image.asset(
                                      'assets/setting_icon.png'
                                  ),
                                ),
                              ),
                            ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),

                       Container(
                         width: double.infinity,
                         height: 40,
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.center,

                           children: [
                             Align(
                                 alignment: Alignment.center,

                                 child: Container(
                                   width: 160,
                                   height: 34,
                                   child: Image.asset(
                                       'assets/home_logo.png'
                                   ),
                                 ),
                             ),
                             Align(
                                 alignment: Alignment.bottomRight,

                                 child: Container(
                                   width: 52,
                                   child: Image.asset(
                                       'assets/sub_logo.png'
                                   ),

                                 )
                             ),
                           ],
                         )
                         ,
                       )
                      ],
                    ),
                  ),
                ),

                SliverPersistentHeader(

                  delegate: BarDelegate(

                    hotWords: hotWords
                  ),
                  pinned: true,

                ),
              ];
            },
            body: new FeedNews(),
            controller: _scrollController,
          ),
        ),
        floatingActionButton: _showBackTop // 当需要显示的时候展示按钮，不需要的时候隐藏，设置 null
            ? FloatingActionButton(
          onPressed: () {
            // scrollController 通过 animateTo 方法滚动到某个具体高度
            // duration 表示动画的时长，curve 表示动画的运行方式，flutter 在 Curves 提供了许多方式
            _scrollController.animateTo(0.0, duration: Duration(milliseconds: 500), curve: Curves.decelerate);
            _showBackTop=false;
            setState(() {

            });
          },
          child: Icon(Icons.vertical_align_top),
        )
            : null,

      );

  }
}
