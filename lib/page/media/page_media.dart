import 'package:chinaso_ui_package/res.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_flutter/page/media/page_media_news.dart';
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
  PageController _pageController;
  List<String> _titleList = <String>['微博','微信', '新华号', '人民号', '澎湃号', '旅游'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _titleList.length);
    _pageController = PageController();
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
//      appBar: AppBar(
//        title: Text('自定义TabBar', style: TextStyle(color: Colors.black54),),
//        backgroundColor: Colors.white,
//        brightness: Brightness.light,
//        elevation: 0,
//        iconTheme: IconThemeData(
//            color: Colors.black54
//        ),
//      ),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            color: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            height: 45,
            child: TabBar(
              labelColor: Colours.titleColor,//选中的颜色
              labelStyle: TextStyle(color:Colours.titleColor, fontSize: 18,fontWeight: FontWeight.bold ),
              unselectedLabelColor: Colours.titleColor,//未选中的颜色
              unselectedLabelStyle: TextStyle(color:Colours.titleColor, fontSize: 14),
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
          Expanded(
              child: PageView.builder(
                  physics: BouncingScrollPhysics(),
                  controller: _pageController,
                  onPageChanged: _onPageChanged,
                  itemCount: _titleList.length,
                  itemBuilder: (context, index) {
                    return MediaNewsPage(type:index.toString());
                  }
              )
          )
        ],
      ),
    );
  }
}
