import 'package:chinaso_ui_package/widget/build_more_footer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_flutter/entity/media_news_entity.dart';
import 'package:home_flutter/http/chinaso_net_new.dart';

/// * @author Suyw
/// * @description: 融媒也瀑布流
/// * @date :2021/3/19
///
 class FeedMediaNews extends StatefulWidget{
   String newsType="";

   FeedMediaNews({Key key,this.newsType}):super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FeedMediaNewsState (urlType:newsType);
  }

 }

class FeedMediaNewsState extends State<FeedMediaNews> {
   String urlType;
   ScrollController _scrollController = new ScrollController();
   int _pageNum = 0;
   int _pageSize = 20;
   bool isloadingMore = false; //是否显示加载中
   bool ishasMore = true; //是否还有更多
   num mCurPage = 1;
   List<MediaNewsDataData> _newsList = List<MediaNewsDataData>();

   FeedMediaNewsState({this.urlType});

   //下拉刷新->转一秒的圈 回调刷新的方法
   Future<void> _onRefresh() async {
     await Future.delayed(Duration(seconds: 1), () {
       _getData();
     });
   }

   void _getData() async {
     await ChinasoRequest(context).getMediaCommonNewsList('general/v1/search',queryParameters: {"accountid":2803301701,"start_index":mCurPage}) .then((list)  => _newsList.addAll(list));

     setState(() {


     });
   }

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //初始化数据
    _getData();
    //上拉刷新监听器
    _scrollController.addListener(() {
      //print(_scrollController.position.pixels); //当前距离值
      //print(_scrollController.position.maxScrollExtent); //最大距离值
      //当 当前距离值>最大距离值-20的时候 进行上拉加载数据并分页
      if (_scrollController.position.pixels >
          _scrollController.position.maxScrollExtent - 20) {
        _getData();
        setState(() {
          _pageNum = _pageNum + 20;
          _pageSize = _pageSize + 20;
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
//    body:  NotificationListener<ScrollNotification>(
//      onNotification: (ScrollNotification scrollInfo) =>
//          _onScrollNotification(scrollInfo),
      body:_newsList.length > 0
        ? RefreshIndicator(
      child:
ListView.builder(
        shrinkWrap: true,
        controller: _scrollController,
        //physics: new NeverScrollableScrollPhysics(),
        itemCount: _newsList.length+1,
        itemBuilder: (context, index) {
      if (index == _newsList.length) {
       return  Footer(isloadingMore: isloadingMore, ishasMore: ishasMore);
      }else{
        return Column(
          children: <Widget>[
            ListTile(
              title: Text(_newsList[index].title,
                maxLines: 1,
              ),
              leading: Image.network(
                _newsList[index].imageList[0],
                fit: BoxFit.cover,
                width: 80,
                height: 80,
              ),
              subtitle: Text("subTitle"),
            ),
            Divider(),

          ],);
      }
        },
      ),

      onRefresh: _onRefresh,
    ): Footer(
        isloadingMore: true, ishasMore: true),);
  }


   _onScrollNotification(ScrollNotification scrollInfo) {

     print("su-in-scroll"+scrollInfo.metrics.extentBefore.toString());
     if(scrollInfo.metrics.extentBefore<50){

       return false;
     }else{
       var maxScroll = scrollInfo.metrics.maxScrollExtent;
       var pixels = scrollInfo.metrics.pixels;
       if (maxScroll == pixels) {
         if (!isloadingMore) {
           if (ishasMore) {
             setState(() {
               isloadingMore = true;
               mCurPage += 1;
             });
             Future.delayed(Duration(seconds: 3), () {
               _getData();
             });
           } else {
             setState(() {
               ishasMore = false;
             });
           }
         }
       }
       return true;

     }

   }
}