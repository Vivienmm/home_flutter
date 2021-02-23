import 'package:chinaso_ui_package/bottom_source_txt.dart';
import 'package:chinaso_ui_package/item/item_component_img.dart';
import 'package:chinaso_ui_package/title_txt.dart';
import 'package:flutter/material.dart';
class ItemImgTitle extends StatefulWidget{

  String title;
  String source;
  int type;
  String date;
  String imgUrl;
  ItemImgTitle({
    Key key,
    this.title,
    this.source,
    this.type,
    this.date,
    this.imgUrl
  }): super(key: key) {
    this.title = this.title;
    this.source=this.source;
    this.type=this.type;
    this.date=this.date;
    this.imgUrl=this.imgUrl;
  }

  @override
  _ItemImgTitleState createState() => _ItemImgTitleState();

}

class _ItemImgTitleState extends State<ItemImgTitle> {
  @override
  Widget build(BuildContext context) {

    return Container(
      //  height: 200,
      padding: EdgeInsets.only(top: 15,bottom: 10),
      margin: EdgeInsets.only(right: 15),
      child: Row(
        textDirection: TextDirection.rtl,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize :MainAxisSize.max,
        children: <Widget>[
          Container(
            height: 70,
            width: 112,
             child:ChinasoImg(
            widget.imgUrl,
            )
          ),
          Expanded(

            child: Column(
              textDirection: TextDirection.ltr,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize :MainAxisSize.max,
              children: <Widget>[
                Container(
                  height: 50,
                  padding: EdgeInsets.only(left: 15),
                  child: TitleText(widget.title
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 15),
                  child: BottomText(widget.source,
                    widget.type,
                    widget.date
                  ),
                  //  margin: EdgeInsets.only(left: 60),
                )

              ],

            ),
          )


        ],


      ),


    );
  }
}