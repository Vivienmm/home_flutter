
import 'package:chinaso_ui_package/res.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_flutter/entity/collection_entity.dart';
import 'package:home_flutter/page/page_collection.dart';
import 'package:home_flutter/utils/string_util.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

/// * @author Suyw
/// * @description: 详情页底部bar
/// * @date :2021/3/3
 class BottomMenu extends StatefulWidget{
   String link;
   String title;

   BuildContext mContext;

   BottomMenu({this.link,this.title});
   @override
   State<StatefulWidget> createState() {
     // TODO: implement createState
     return BottomMoreMenu(url: link,title: title);
   }

 }

class BottomMoreMenu extends State<BottomMenu>{
  List<String> nameItems = <String>[
    '添加收藏',
    '收藏列表',
    '复制链接',
    '刷新',
  ];
  String url="https://guangdiu.com/api/showdetail.php";
  int type=0;
  String title="中国搜索";
  BottomMoreMenu({this.url,this.title});
  Database dataBase;
  bool isCollected=false;
  Future<void> initDataBase() async {
    dataBase = await openDatabase(
      join(await getDatabasesPath(), Strings.CHINASO_COL_DB),
      onCreate: (db, version) => db.execute(
          "CREATE TABLE "+Strings.COLLECT_TABLE+" (title TEXT , webUrl TEXT PRIMARY KEY)"),
      onUpgrade: (db, oldVersion, newVersion) {
        //dosth for migration
        print("old:$oldVersion,new:$newVersion");
      },
      version: 1,
    );

    isCollcted();

    print("database:$dataBase");
  }

  void isCollcted() async {
    isCollected=  await searchCollection(url,dataBase,Strings.COLLECT_TABLE) ;
    setState(() {

    });
  }

  @override
  void initState() {

    super.initState();
    initDataBase();

  }

  @override
  Widget build(BuildContext context) {
    widget.mContext=context;
    return SafeArea(

      child:
      Container(
        decoration: new BoxDecoration(
          color: Colors.transparent,
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child:Material(
                  color: Colors.blue,
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                    ],
                  ),
                ),
              ),
              Builder(

                builder:(BuildContext context) {
                  return CardView(context);
                },
              )
            ]),
      ),
    );
    //return CardView(context);
  }

  Card CardView(BuildContext context) {

    return  Card(
    clipBehavior: Clip.hardEdge,
   // margin: const EdgeInsets.only(left: 8,  right: 8,bottom: 10),
    shape: const RoundedRectangleBorder(
    borderRadius: const BorderRadius.only(
    topLeft: Radius.circular(14.0),
    topRight: Radius.circular(14.0)),
    ),
    child: new Column(
      children: <Widget>[
        new Padding(
          padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
          child: new Container(
            height: 60.0,
            child: new GridView.builder(
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 5.0,
                  childAspectRatio: 1.0),
                  itemBuilder: (BuildContext context, int index) {
                return bottomItem(index);
              },
              itemCount: nameItems.length,
            ),
          ),
        ),
        new Container(
          height: 1.5,
          color: Colors.blueGrey,
        ),
        new Center(
          child: new Padding(
            padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
            child: GestureDetector(
                onTap:(){
                  Navigator.pop(context);
                },
                child: new Text(
                  '取  消',
                  style: new TextStyle(fontSize: 18.0, color: Colors.blueGrey),
                )),
          ),
        ),
      ],
    ),
    );
  }
   bottomItem(int index) {
     switch(index){
       case 0:
         return new InkWell(
           onTap: () {
             if(isCollected){
               deleteCollection(url, dataBase, Strings.COLLECT_TABLE);

               setState(() {
                 isCollected=false;
               });
             }else{
               CollectionEntity enty=new CollectionEntity(title: title,webUrl: url);
               insertCollection(enty, dataBase, Strings.COLLECT_TABLE);
               setState(() {
                 isCollected=true;
               });
             }
           },
           child: new Column(
             children: <Widget>[
               collectIcon(),

               Text(nameItems[index])
             ],
           ),
         );
       case 1:
         return new InkWell(
           onTap: () {
             Navigator.push(widget.mContext, MaterialPageRoute(builder: (cx)=>CollectionPage()));

           },
           child: new Column(
             children: <Widget>[
               ImageIcon(
                 AssetImage('assets/bottom_bar/more_collection_list.png'),size: 30,),
               Text(nameItems[index])
             ],
           ),
         );
         break;
       case 2:
         return new InkWell(
           onTap: () {},
           child: new Column(
             children: <Widget>[
               ImageIcon(
                 AssetImage('assets/bottom_bar/more_copy_link.png'),size: 30,),
               Text(nameItems[index])
             ],
           ),
         );
         break;
       default:
         return  new InkWell(
           onTap: () {},
           child: new Column(
             children: <Widget>[
               ImageIcon(
                 AssetImage('assets/bottom_bar/more_refresh.png'),size:30,),
               Text(nameItems[index])
             ],
           ),
         );
         break;

     }
   }


   @override
  void dispose() {
    // TODO: implement dispose
     dataBase.close();
    super.dispose();
  }

  collectIcon() {
    if(isCollected){
     return ImageIcon(
        AssetImage('assets/bottom_bar/more_collect_success.png'),size: 30,color: Colours.indicatorSelectedColor,);
    }else{
    return ImageIcon(
        AssetImage('assets/bottom_bar/more_collection.png'),size: 30,);
    }
  }
 }