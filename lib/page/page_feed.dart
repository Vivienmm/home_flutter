

import 'dart:convert';

import 'package:chinaso_http_package/log_error.dart';

import 'package:chinaso_ui_package/item/item_no_img.dart';
import 'package:chinaso_ui_package/item/item_one_img.dart';
import 'package:chinaso_ui_package/item/item_three_imgs.dart';
import 'package:chinaso_ui_package/res.dart';
import 'package:chinaso_ui_package/widget/build_more_footer.dart';
import 'package:flutter/material.dart';
import 'package:home_flutter/generated/json/home_feed_entity_helper.dart';
import 'package:home_flutter/http/api_service.dart';
import 'package:home_flutter/http/home_feed_entity.dart';
import 'package:home_flutter/page/page_channel.dart';
import 'package:home_flutter/page/page_web.dart';


class FeedNews extends StatefulWidget {
  FeedNews({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<FeedNews> {

  //定义控制器
  ScrollController scroll = new ScrollController();
  bool isloadingMore = false; //是否显示加载中
  bool ishasMore = true; //是否还有更多
  num mCurPage = 1;
  List<HomeFeedEntityInner> mAppResultList = [];

  @override
  void initState() {
    super.initState();
    getFeed();

  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: NotificationListener<ScrollNotification>(
        child: new ListView.separated(
          itemCount: mAppResultList.length + 1,
          separatorBuilder: (context, index) {
            return Divider(
                height: 1.0, thickness: 1, color: Colours.dividerColor);
          },
          itemBuilder: (context, index) {
            if (index == mAppResultList.length) {
              return Container(
                height: 40,
                child: Footer(
                    isloadingMore: isloadingMore, ishasMore: ishasMore),
              );
            } else {
              return GestureDetector(
                  child: getContentItem(context, index, mAppResultList[index]),
                  onTap: (){
                    _itemClick(mAppResultList[index]);
                  });
            }
          },

          //controller: scroll,
        ),
        onNotification: (ScrollNotification scrollInfo) =>
            _onScrollNotification(scrollInfo),
      ),
    );
  }



  Widget getContentItem(BuildContext context, int index, HomeFeedEntityInner entity) {
    String title=entity.titleCN;
    int type=0;
    String source=entity.sourceName;
    String date=entity.publishedAt;
    int imgLenth=0;
    if(null!=entity.pictureList){
      imgLenth=entity.pictureList.length;
    }
    if(index==0){
      return ChannelPage();
    }else{
      switch(entity.exType){

        case "1":
          type=1;
          if(imgLenth>0){
            return ItemImgTitle(title: title,source: source,type: type,date: date,imgUrl: entity.pictureList[0]);
          }else{
            return ItemNoImg(title: title,source: source,type: type,date: date);
          }
          break;
        case "2":
          type=2;
          if(imgLenth>0){
            return ItemImgTitle(title: title,source: source,type: type,date: date,imgUrl: entity.pictureList[0]);
          }else{
            return ItemNoImg(title: title,source: source,type: type,date: date);
          }
          break;
        default:
          type=0;
          if(imgLenth>2){
            return ItemThreeImgs(title: title,source: source,type: type,date: date,imgs: entity.pictureList);

          }else if(imgLenth>0) {
            return ItemImgTitle(title: title,source: source,type: type,date: date,imgUrl: entity.pictureList[0]);
          }else
            return ItemNoImg(title: title,source: source,type: type,date: date);
      }

    }


  }


  _onScrollNotification(ScrollNotification scrollInfo) {

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

            getFeed();
          });
        } else {
          setState(() {
            ishasMore = false;
          });
        }
      }
    }
  }

  Future getFeed (){

    /// 调用
    ApiInterface.getFeed(
        mCurPage) .then((data) {
      /// 请求成功 进行成功的逻辑处
      Map<String, dynamic> responseData =  jsonDecode(data);

      Map<String, dynamic> responseDataInner =  jsonDecode(jsonEncode(responseData["data"]));
      HomeFeedEntity entity=new HomeFeedEntity();
      homeFeedEntityFromJson(entity,responseDataInner);
      if(mCurPage==1){
        mAppResultList.addAll(entity.toplist);
      }

      print('getFeed--表'+entity.results[0].titleCN);
      setState(() {
        mAppResultList.addAll(entity.results);
        isloadingMore = false;

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

  void _itemClick(HomeFeedEntityInner mAppResultList) {
    Navigator.push(context, MaterialPageRoute(builder: (cx)=>WebDetail(title:mAppResultList.titleCN,url:mAppResultList.url,)));
  }

}

