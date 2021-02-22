import 'package:flutter/material.dart';
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

//       child: GridView.builder(
//
//
//          itemCount: items.length,
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 4,
//             childAspectRatio: 1
//         ),
//           itemBuilder: (BuildContext context,var index){
//             return Image.network(
//               "https://pic2.zhimg.com/v2-639b49f2f6578eabddc458b84eb3c6a1.jpg",
//               fit: BoxFit.fill,
//             );
//           }
//
//        ),
        child: GridView.custom(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 6.0,
        childAspectRatio: 0.5,
        crossAxisCount: 4,),
      childrenDelegate: SliverChildBuilderDelegate((context, position) {
        return getItemContainer(items[position]);
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
Widget getItemContainer(ChannelItem item) {
  return Container(
    width: 40.0,
    height:60.0,
    alignment: Alignment.center,
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
  );
}