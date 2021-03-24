import 'package:flutter/cupertino.dart';

/// * @author Suyw
/// * @description:
/// * @date :2021/3/18

class TabChild extends StatelessWidget{
  final String tabTitle;
  final String iconUrl;

  const TabChild({Key key, this.tabTitle, this.iconUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Container(
     child:Column(

       children: [
         ClipOval(
           child: Image.network(
             "https://tva1.sinaimg.cn/large/006y8mN6gy1g7aa03bmfpj3069069mx8.jpg",
             width: 20,
             height: 20,
           ),
         ),
         Text(tabTitle),
       ],
     ) ,
   );
  }

}