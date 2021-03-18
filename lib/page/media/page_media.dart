import 'package:chinaso_ui_package/res.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:home_flutter/page/media/page_media_news.dart';
import 'package:home_flutter/ui/media_itm_tab.dart';
import 'package:home_flutter/ui/media_tab.dart';
import 'package:home_flutter/ui/tab_indicator.dart';
import 'package:weather/util/loc_baidu.dart';

class MediaPage extends StatefulWidget{

  const MediaPage({Key key}):super(key:key);

  @override
  _MediaPageState createState() => _MediaPageState();

}

class _MediaPageState extends State<MediaPage> with TickerProviderStateMixin{
  TabController _tabController;
  TabController _subTabController;
  PageController _pageController;
  List<String> _titleList = <String>['微博','微信', '新华号', '人民号', '澎湃号'];
  var _scrollController = ScrollController();
  var _showTop = false;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _titleList.length);
    _subTabController = TabController(vsync: this, length:5);
    _pageController = PageController();
    // 对 scrollController 进行监听
    _scrollController.addListener(() {
      // _scrollController.position.pixels 获取当前滚动部件滚动的距离
      // window.physicalSize.height 获取屏幕高度
      // 当滚动距离大于 800 后，显示回到顶部按钮
      print("滚动--"+_scrollController.position.pixels.toString());
      if(_scrollController.position.pixels >= 40&&!_showTop) {
        setState(() {
          _showTop = true;
        });
      }

      //   setState(() => _showBackTop = _scrollController.position.pixels >= 800);
    });
  }

  void _changeTab(int index) {
    _pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  void _onPageChanged(int index) {
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

      body: NestedScrollView(
        key: UniqueKey(),
        headerSliverBuilder: (contex, bool innerBoxIsScrolled) {
          return <Widget>[

            SliverToBoxAdapter(
              child: Column(
                  children: <Widget>[
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

                  ]),),

            SliverLayoutBuilder(
              builder: (BuildContext context, SliverConstraints constraints) {
                print('${constraints.userScrollDirection}' +
                    constraints.scrollOffset.toString());
                var color = Colors.red;
                var height = 0.00;
                if (constraints.userScrollDirection ==
                    ScrollDirection.forward) {
                  _showTop = false;
                  color = Colors.blue;
                  height = 150.00;
                } else {
                  height = 0.00;
                }
                if (_showTop) {
                  return SliverAppBar(
                    pinned: true,
                    expandedHeight: height,
                    flexibleSpace: FlexibleSpaceBar(
                      title: Text('微信'),
                      background: Image.network(
                        'http://img.haote.com/upload/20180918/2018091815372344164.jpg',
                        fit: BoxFit.fitHeight,
                        color: color,
                      ),
                    ),
                  );
                } else {
                  return SliverToBoxAdapter(
                    child: Container(height: 1,),
                  );
                }
              },
            ),


          ];
        },
        body: PageView.builder(
            physics: BouncingScrollPhysics(),
            controller: _pageController,
            onPageChanged: _onPageChanged,
            itemCount: _titleList.length,
            itemBuilder: (context, index) {
              return MediaNewsPage(type: index.toString());
            }
        ),
        controller: _scrollController,
      ),
    );
  }
}
class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {

 bool isSHow=false;

 MySliverPersistentHeaderDelegate({
    Key key,
    this.isSHow,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {

    if(isSHow){

      return Container(
          color: Colors.blue,
          alignment: Alignment.center,
          child: Text('我是一个SliverPersistentHeader',
              style: TextStyle(color: Colors.white)));
    }else{
      return Container(

      );
    }

  }

  @override
  double get maxExtent => 80.0;

  @override
  double get minExtent => 1.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) =>
      true; // 如果内容需要更新，设置为true
}