import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:home_flutter/http/channel_item.dart';

class PageItem extends StatelessWidget {
//  final String title;
//  final Color color;

  final List<ChannelItem> items;



  //PageItem(this.title, this.img);
  PageItem(this.items);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(4),
      color: Colors.white,

        child: GridView.custom(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 6.0,
        childAspectRatio: 0.5,
        crossAxisCount: 4,),
      childrenDelegate: SliverChildBuilderDelegate((context, position) {
        return getItemContainer(items[position],context);
      },
          childCount: items.length),
          shrinkWrap: true,
          primary: false,
          physics: NeverScrollableScrollPhysics(),

        )
    ,
    );
  }
}
Widget getItemContainer(ChannelItem item,BuildContext context) {

  return InkWell(
      onTap: (){
        print("点击了 ");

        Fluttertoast.showToast(
          msg:  item.channelName,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
            timeInSecForIos: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
      },

  child: Container(
    width: 40.0,
    height:60.0,
    alignment: Alignment.center,
    color: Colors.white,
    child: Column(
      children: [

        CircleAvatar(
          //头像半径
          radius: 20,
          //头像图片
          backgroundImage:  AssetImage(item.channelImg),
        ),

        Text(
          item.channelName,
          style: TextStyle(color: Colors.grey, fontSize: 10),
        ),

      ],
    ),
  ),);

}