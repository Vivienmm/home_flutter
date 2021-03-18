import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_flutter/entity/media_entity.dart';
import 'package:home_flutter/http/chinaso_net_new.dart';
import 'package:home_flutter/ui/media_itm_tab.dart';
import 'package:home_flutter/utils/tab_child.dart';

/// * @author Suyw
/// * @description:
/// * @date :2021/3/16

 class MediaNewsPage extends StatefulWidget{

   MediaNewsPage({Key key,this.type}) : assert(type != null),super(key: key);

   String type;
   
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createStareturn  throw UnimplementedError();
    return MediaNewsPageState (mediaType: type);
  }

 }

class MediaNewsPageState extends State<MediaNewsPage> with SingleTickerProviderStateMixin{
   String mediaType;
   List<MediaData> mediaList=new List();

   MediaNewsPageState({this.mediaType});
   TabController _tabController;

   @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getMedia(mediaType);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: TabBar(
            controller: this._tabController,
            isScrollable:true,
            tabs: TabWidgets(),),
          ),
        body:ListViewContnet(index:this._tabController.index));

  }

  void getMedia(String mediaType) async {
     
    await ChinasoRequest(context).getMediaList("general/v1/om/media/list",queryParameters: {"type":mediaType}) .then((list) => list.forEach((s) => mediaList.add(s)));

    setState(() {
      this._tabController = new TabController(vsync: this, length: mediaList.length);


      this._tabController.addListener(()  {
        setState(() {

        });
//      print(this._tabController.toString());
//      print(this._tabController.index);
//      print(this._tabController.length);
//      print(this._tabController.previousIndex);

      });
    });

  }

  TabWidgets() {
    List<Widget> widgets=new List();

    for (int i=0;i<mediaList.length;i++){
      print("TabWidgets"+mediaList[i].dataName);
      widgets.add(MediaItemTab(child: TabChild(tabTitle: mediaList[i].dataName,iconUrl: mediaList[i].dataIcon ),));
    }

    return widgets;
  }

}

class ListViewContnet extends StatelessWidget {
   final int index;
  const ListViewContnet({Key key,this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: new NeverScrollableScrollPhysics(),
      children: <Widget>[
        ListTile(title: Text("TITLE"+index.toString())),
        ListTile(title: Text("TITLE")),
        ListTile(title: Text("TITLE")),
        ListTile(title: Text("TITLE")),
        ListTile(title: Text("TITLE")),
        ListTile(title: Text("TITLE")),
        ListTile(title: Text("TITLE")),
        ListTile(title: Text("TITLE")),
        ListTile(title: Text("TITLE")),
        ListTile(title: Text("TITLE")),
        ListTile(title: Text("TITLE")),
        ListTile(title: Text("TITLE")),
        ListTile(title: Text("TITLE")),
        ListTile(title: Text("TITLE")),
        ListTile(title: Text("TITLE")),
        ListTile(title: Text("TITLE")),
      ],
    );
  }
}