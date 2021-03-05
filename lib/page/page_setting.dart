

import 'package:chinaso_ability/cache_manager.dart';
import 'package:chinaso_ability/cache_setting.dart';
import 'package:chinaso_ui_package/res.dart';
import 'package:chinaso_ui_package/util/date_util.dart';
import 'package:chinaso_ui_package/widget/info_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:home_flutter/http/net_api_constant.dart';
import 'package:home_flutter/page/page_collection.dart';
import 'package:home_flutter/page/page_history.dart';
import 'package:home_flutter/utils/string_util.dart';
import 'package:mmkv/mmkv.dart';
import 'package:sqflite/sqflite.dart';

import 'page_web.dart';
import 'package:path/path.dart';

class SettingPage extends StatefulWidget{


  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  BuildContext mContext;
  String cacheSize="0M";
  String dayOff="0";
  String collectionNum="0";
  String hisNum="0";

   getCache()async {
    double value = await CacheManager.loadApplicationCache();
    String str = CacheManager.formatSize(value);
    print('获取app缓存: ' + str);

    setState(() {
      cacheSize=str;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCache();
    getDate();
    getCollections();
    getHistorys();
  }
  @override
  Widget build(BuildContext context) {
    mContext=context;

    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(

        title: new Text('设置',style: TextStyle(color: Colours.titleColor),),
        //leading: new Icon(Icons.arrow_back,color: Colours.titleColor,),
        leading: new IconButton(
          icon: new Container(
            padding: EdgeInsets.all(3.0),
            child: new Icon(
              Icons.arrow_back,color: Colours.titleColor,
            ),
          ),
          onPressed: (){
           Navigator.pop(context);
          },
        ),

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
                    InfoCard(dayOff,"天","使用国搜"),
                    InkWell(child: InfoCard(collectionNum,"篇","收藏列表"),onTap:(){ Navigator.push(context, MaterialPageRoute( builder: (context) =>CollectionPage()));}),
                    InkWell(child: InfoCard(hisNum,"篇","浏览历史"),onTap:(){ Navigator.push(context, MaterialPageRoute( builder: (context) =>HistoryPage()));}),

                  ],
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(10),
              elevation: 20,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),),
              child: Column(
                children: [

                  Container(
                    alignment: Alignment.bottomLeft,
                    padding: EdgeInsets.only(left:16,top:10,bottom: 10, ),
                    child:Text("系统设置",style: TextStyle(color: Colours.titleColor,fontSize: 17,fontWeight: FontWeight.bold),textAlign: TextAlign.left,),
                  ),

                  Divider(indent:16,endIndent:16),

                  ListTile(title: Text("清除缓存"),trailing: new Text(cacheSize),onTap: () => clearCache(),),
                  ListTile(title: Text("检查更新"),trailing: new Text("V 5.1.4"),onTap: () => _itemClick(HttpConstant.COOPERATION_URL),),
                  ListTile(title: Text("字体大小"),trailing: new Icon(Icons.arrow_forward_ios),onTap: () => _itemClick(HttpConstant.COOPERATION_URL),),

                  Divider(height:10 ,thickness:6,color: Colours.dividerColor,indent:16,endIndent:16),
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
    Navigator.push(mContext, MaterialPageRoute(builder: (cx)=>WebDetail(url:url,)));
  }

  clearCache() {
    CacheManager.clearApplicationCache();
    Fluttertoast.showToast(
        msg:  "缓存清除完成",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.grey,
        textColor: Colours.titleColor,
        fontSize: 16.0
    );
    setState(() {
      cacheSize="0M";
    });
  }

  void getDate() {
    var kv = MMKV.defaultMMKV();
    String date=kv.decodeString("firstDate");
    String days=DateUtil.getOffDays(date);

    setState(() {
      dayOff=days;
    });
  }

  Future<void> getCollections() async {
    Database dataBaseCol = await openDatabase(
        join(await getDatabasesPath(), Strings.CHINASO_COL_DB),
    onCreate: (db, version) => db.execute(
    "CREATE TABLE "+Strings.COLLECT_TABLE+" (title TEXT , webUrl TEXT PRIMARY KEY)"),
    onUpgrade: (db, oldVersion, newVersion) {
    //dosth for migration
    print("old:$oldVersion,new:$newVersion");
    },
    version: 1,
    );
    final List<Map<String, dynamic>> maps = await dataBaseCol.query(Strings.COLLECT_TABLE);
    setState(() {
      collectionNum= maps.length.toString();
    });

  }

  Future<void> getHistorys() async {
    Database dataBaseHis = await openDatabase(
      join(await getDatabasesPath(), Strings.CHINASO_DB),
      onCreate: (db, version) => db.execute(
          "CREATE TABLE "+Strings.HISTORY_TABLE+" (title TEXT , webUrl TEXT PRIMARY KEY, date TEXT)"),
      onUpgrade: (db, oldVersion, newVersion) {
        //dosth for migration
        print("old:$oldVersion,new:$newVersion");
      },
      version: 1,
    );

    final List<Map<String, dynamic>> mapsH = await dataBaseHis.query(Strings.HISTORY_TABLE);
    setState(() {
      hisNum= mapsH.length.toString();
    });
  }


}

