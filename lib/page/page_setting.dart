

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
        title: new Text('设置'),
        leading: new Icon(Icons.arrow_back),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Column(

        children: [
          Card(
            margin: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text("张三",style: TextStyle(fontSize: 28)),
                  subtitle: Text("董事长"),
                ),
                Divider(),
                ListTile(
                  title: Text("电话:123456789"),
                ),
                ListTile(title: Text("地址：xxxxxxxxxxxxxxxxx"))
              ],
            ),
          ),
          Card(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [

                Divider(),
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
    );



  }
  void _itemClick(String url) {
    Navigator.push(mContext, MaterialPageRoute(builder: (cx)=>ItemInfoDetail(url:url,)));
  }
}