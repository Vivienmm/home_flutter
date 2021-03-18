import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
   MediaNewsPageState({this.mediaType});
   TabController _tabController;

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._tabController = new TabController(vsync: this, length: 5);
    this._tabController.addListener(() {
      setState(() {

      });
//      print(this._tabController.toString());
//      print(this._tabController.index);
//      print(this._tabController.length);
//      print(this._tabController.previousIndex);
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: TabBar(
            controller: this._tabController,
            tabs: <Widget>[
              MediaItemTab(child:
              ClipOval(
                child: Image.network(
                  "https://tva1.sinaimg.cn/large/006y8mN6gy1g7aa03bmfpj3069069mx8.jpg",
                  width: 20,
                  height: 20,
                ),
              ),),
              MediaItemTab(child: TabChild(tabTitle: "女装",iconUrl: "https://tva1.sinaimg.cn/large/006y8mN6gy1g7aa03bmfpj3069069mx8.jpg",),),
              MediaItemTab(text: '童装'),
              MediaItemTab(text: '夏装'),
              MediaItemTab(text: '冬装'),
            ],
          ),
        ),
        body:ListViewContnet(index:this._tabController.index));
//        body: TabBarView(
//          controller: this._tabController,
//          children: <Widget>[
//            ListViewContnet(),
//            ListViewContnet(),
//            ListViewContnet(),
//            ListViewContnet(),
//            ListViewContnet(),
//          ],
//        ));
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