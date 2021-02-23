import 'package:chinaso_ui_package/bottom_source_txt.dart';
import 'package:chinaso_ui_package/item/item_component_img.dart';
import 'package:chinaso_ui_package/title_txt.dart';
import 'package:flutter/material.dart';

class ItemThreeImgs extends StatefulWidget{

  String title;
  String source;
  int type;
  String date;
  List<String> imgs;
  ItemThreeImgs({
    Key key,
    this.title,
    this.source,
    this.type,
    this.date,
    this.imgs
  }): super(key: key) {
    this.title = this.title;
    this.source=this.source;
    this.type=this.type;
    this.date=this.date;
    this.imgs=this.imgs;
  }

  @override
  _ItemThreeImgsState createState() => _ItemThreeImgsState();

}

class _ItemThreeImgsState extends State<ItemThreeImgs> {
  @override
  Widget build(BuildContext context) {

    return Container(
      //  height: 200,
      padding: EdgeInsets.only(top: 15,bottom: 10),
      margin: EdgeInsets.only(left: 15,right: 15),
      child: Column(

        textDirection: TextDirection.ltr,
        crossAxisAlignment: CrossAxisAlignment.center,

        mainAxisSize :MainAxisSize.max,
        children: <Widget>[
          Container(

            child: TitleText(widget.title,
            ),
          ),
          SizedBox(height: 5,),

          Container(

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[

               ChinasoImg(
                 widget.imgs[0],
               ),
                ChinasoImg(
                  widget.imgs[1],
                  ),
                ChinasoImg(
                  widget.imgs[2],
                    ),
              ],
            ),
          ),
          SizedBox(height: 5,),
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