
import 'package:chinaso_ui_package/txt/title_txt.dart';
import 'package:flutter/material.dart';

import 'bottom_source_txt.dart';

class ItemNoImg extends StatefulWidget{

  String title;
  String source;
  int type;
  String date;
  ItemNoImg({
    Key key,
    this.title,
    this.source,
    this.type,
    this.date
  }): super(key: key) {
    this.title = this.title;
    this.source=this.source;
    this.type=this.type;
    this.date=this.date;
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

            child: TitleText(widget.title,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Container(

            child: BottomText(widget.source,
               widget.type,
            widget.date), //  margin: EdgeInsets.only(left: 60),
          )

        ],

      ),


    );



  }
}