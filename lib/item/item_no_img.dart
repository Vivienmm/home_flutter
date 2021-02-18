import 'package:flutter/material.dart';
import 'package:home_flutter/http/home_feed_entity.dart';

class ItemNoImg extends StatefulWidget{

 HomeFeedEntityInner itemData;
  ItemNoImg({
    Key key,
    this.itemData,

  }): super(key: key) {
    this.itemData = this.itemData;

  }

  @override
  _ItemNoImgState createState() => _ItemNoImgState();

}

class _ItemNoImgState extends State<ItemNoImg> {
  @override
  Widget build(BuildContext context) {

    return Container(
      //  height: 200,
      padding: EdgeInsets.only(top: 15,bottom: 10),
      margin: EdgeInsets.only(left: 15,right: 15),
      child: Column(
        textDirection: TextDirection.ltr,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize :MainAxisSize.max,
        children: <Widget>[
          Container(
            height: 48,
            child: Text(widget.itemData.titleCN,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 16.0, color: Colors.black,fontWeight:FontWeight.w500)),
          ),
          Container(

            child: Text(widget.itemData.sourceName,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 11.0, color: Colors.grey)),
            //  margin: EdgeInsets.only(left: 60),
          )


        ],


      ),


    );



  }
}