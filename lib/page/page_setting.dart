

import 'package:chinaso_ui_package/res.dart';
import 'package:chinaso_ui_package/widget/info_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_flutter/http/net_api_constant.dart';

import 'page_web.dart';

class SettingPage extends StatelessWidget{

  BuildContext mContext;
  @override
  Widget build(BuildContext context) {
    mContext=context;
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        title: new Text('设置',style: TextStyle(color: Colours.titleColor),),
        leading: new Icon(Icons.arrow_back,color: Colours.titleColor,),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(

              elevation: 10,
              margin: EdgeInsets.all(10),
              child: Container(
                padding:EdgeInsets.only(left: 30, right: 30, top: 25, bottom: 25),
                child: Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
//                交叉轴的布局方式，对于column来说就是水平方向的布局方式
                  crossAxisAlignment: CrossAxisAlignment.center,
                  //就是字child的垂直布局方向，向上还是向下
                  verticalDirection: VerticalDirection.down,
                  children: <Widget>[
                    InfoCard("566","天","使用国搜"),
                    InfoCard("566","篇","收藏列表"),
                    InfoCard("566","篇","浏览历史"),

                  ],
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(10),
              elevation: 20,
              child: Column(
                children: [

                  Container(
                    alignment: Alignment.bottomLeft,
                    padding: EdgeInsets.only(left:16,top:10,bottom: 10, ),
                    child:Text("系统设置",style: TextStyle(color: Colours.titleColor,fontSize: 17,fontWeight: FontWeight.bold),textAlign: TextAlign.left,),
                  ),

                  Divider(),

                  ListTile(title: Text("清除缓存"),trailing: new Text("xMB"),onTap: () => _itemClick(HttpConstant.COOPERATION_URL),),
                  ListTile(title: Text("检查更新"),trailing: new Text("V 5.1.4"),onTap: () => _itemClick(HttpConstant.COOPERATION_URL),),
                  ListTile(title: Text("字体大小"),trailing: new Icon(Icons.arrow_forward_ios),onTap: () => _itemClick(HttpConstant.COOPERATION_URL),),

                  Divider(height:6 ,color: Colors.grey,),
                  ListTile(title: Text("合作推广"),trailing: new Icon(Icons.arrow_forward_ios),onTap: () => _itemClick(HttpConstant.COOPERATION_URL),),
                  ListTile(title: Text("使用帮助"),trailing: new Icon(Icons.arrow_forward_ios),onTap: () => _itemClick(HttpConstant.HELP_URL),),
                  ListTile(title: Text("意见反馈"),trailing: new Icon(Icons.arrow_forward_ios),onTap: () => _itemClick(HttpConstant.FEED_BACK_URL),),
                  ListTile(title: Text("用户协议"),trailing: new Icon(Icons.arrow_forward_ios),onTap: () => _itemClick(HttpConstant.USER_PRIVACY_URL),),
                  ListTile(title: Text("隐私政策"),trailing: new Icon(Icons.arrow_forward_ios),onTap: () => _itemClick(HttpConstant.PRIVACY_URL),),
                  ListTile(title: Text("关于我们"),trailing: new Icon(Icons.arrow_forward_ios),onTap: () => _itemClick(HttpConstant.ABOUT_US_URL),),
                ],
              ),
            )
          ],
        ),
      ) ,
    );



  }
  void _itemClick(String url) {
    Navigator.push(mContext, MaterialPageRoute(builder: (cx)=>ItemInfoDetail(url:url,)));
  }
}

