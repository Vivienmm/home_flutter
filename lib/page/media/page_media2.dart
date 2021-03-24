
import 'package:chinaso_ui_package/res.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:home_flutter/page/media/page_media_news.dart';
import 'package:home_flutter/ui/media_itm_tab.dart';
import 'package:home_flutter/ui/media_tab.dart';
import 'package:home_flutter/ui/search_bar_delegate.dart';
import 'package:home_flutter/ui/tab_indicator.dart';
import 'package:weather/util/loc_baidu.dart';

/// * @author Suyw
/// * @description:
/// * @date :2021/3/18
class MediaPage2 extends StatefulWidget{

  const MediaPage2({Key key}):super(key:key);

  @override
  _MediaPage2State createState() => _MediaPage2State();

}

class _MediaPage2State extends State<MediaPage2> with TickerProviderStateMixin{
  TabController _tabController;
  TabController _subTabController;
  PageController _pageController;
  int _pageIndex=0;
  List<String> _titleList = <String>['微博','微信', '新华号', '人民号', '澎湃号'];
  List<String> _typeQueryList = <String>['0','1', '3', '4', '5'];
  var _scrollController = ScrollController();
  OverlayEntry _overlayEntry;

  OverlayEntry createHeaderPopupWindow(int typeIndex) {
    List<String> _typeList = <String>['微博','微信', '新华号', '人民号', '澎湃号'];



    OverlayEntry overlayEntry = new OverlayEntry(builder: (context) {
      return new Positioned(
        top: 50,
        child: new Material(
          child: new Container(
            height: 60,
            width: MediaQuery
                .of(context)
                .size
                .width,
            alignment: Alignment.topCenter,

            child: new Text(_typeList[typeIndex]),
          ),

          color: Colors.white,

        ),
      );
    });
    return overlayEntry;
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _titleList.length);
    _subTabController = TabController(vsync: this, length:5);
    _pageController = PageController();
    // 对 scrollController 进行监听
    _scrollController.addListener(() {

      // _scrollController.position.pixels 获取当前滚动部件滚动的距离

      // 当滚动距离大于 800 后，显示回到顶部按钮
      print("滚动--"+_scrollController.position.pixels.toString());
      if(_scrollController.position.pixels >= 40) {

        if(null!=_overlayEntry){

        }else{
          _overlayEntry=createHeaderPopupWindow(_pageIndex) ;
          WidgetsBinding.instance.addPostFrameCallback((_) =>  Overlay.of(context).insert(_overlayEntry));
        }

      }else{

          if (_overlayEntry != null) {
            _overlayEntry.remove();
            _overlayEntry = null;
          }
      }
    });
  }

  void _changeTab(int index) {
    setState(() {
      _pageIndex=index;
    });
    _pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  void _onPageChanged(int index) {
    setState(() {
      _pageIndex=index;
    });

    _tabController.animateTo(index, duration: Duration(milliseconds: 300));
  }

  @override
  void dispose() {
    _pageController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
      //滑动指示器是否在头部 true在前端，false在末端

      if(notification.metrics.extentBefore >= 50) {


        if(null!=_overlayEntry){

        }else{
          _overlayEntry=createHeaderPopupWindow(_pageIndex) ;
          WidgetsBinding.instance.addPostFrameCallback((_) =>  Overlay.of(context).insert(_overlayEntry));
        }
        return true;
      }else{

        if (_overlayEntry != null) {
          _overlayEntry.remove();
          _overlayEntry = null;
        }
        return false;
      }

      },
    child:NestedScrollView(
      key: UniqueKey(),
        scrollDirection: Axis.vertical,
       // physics: BouncingScrollPhysics(),
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          _mySliverAppBar(),
        ];
      },
        body:Column(

          mainAxisSize:MainAxisSize.min,

      children: [

        Container(
          width: double.infinity,
          color: Colors.white,

          padding: EdgeInsets.symmetric(
              vertical: 10, horizontal: 5),
          height: 45,
          child: TabBar(
            labelColor: Colours.titleColor,
            //选中的颜色
            labelStyle: TextStyle(color: Colours.titleColor,
                fontSize: 18,
                fontWeight: FontWeight.bold),
            unselectedLabelColor: Colours.titleColor,
            //未选中的颜色
            unselectedLabelStyle: TextStyle(
                color: Colours.titleColor, fontSize: 14),
            isScrollable: true,
            //自定义indicator样式
            indicator: RoundUnderlineTabIndicator(
                borderSide: BorderSide(
                  width: 3.5,
                  color: Colours.indicatorSelectedColor,
                )

            ),
            controller: _tabController,
            onTap: _changeTab,
            tabs: _titleList.map((e) => MediaTab(text: e)).toList(),
          ),
        ),

        Flexible(child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child:PageView.builder(

              controller: _pageController,
              onPageChanged: _onPageChanged,
              itemCount: _titleList.length,
              itemBuilder: (context, index) {
                return MediaNewsPage(type: _typeQueryList[index]);
              }
          ),
        ),),

      ],
    ),),),);


  }

  _mySliverAppBar() {
    return SliverAppBar(
      title: Text('NestedScrollView'),
      expandedHeight: 20,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
      ),
    );
  }

}


