

import 'package:chinaso_ui_package/res.dart';
import 'package:chinaso_ui_package/util/date_transform.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class BottomText extends StatelessWidget{
  final String source;
  final int type;//1是置顶，2是广告，0是普通
  final String date;


  const BottomText(
      this.source,
      this.type,
      this.date,
      {
        Key key,

      })  :super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: <Widget>[
        TypeText(type),

        Text(source,
          style: TextStyle(
            color:Colours.sourceColor,
            fontSize:11 ,
            height: 1.1,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(width: 8,),
        TimeText(date,type),

      ],
    );
  }


}

class TimeText extends StatelessWidget{
  final String date;
  final int type;

  const TimeText(
      this.date, this.type
      );

  @override
  Widget build(BuildContext context) {
    if(type==0){

      String timeStr=RelativeDateFormat.format(DateTime.parse(date));
      return Text(timeStr,
        style: TextStyle(
          color:Colours.sourceColor ,
          fontSize:11 ,
          height: 1.1,
        ),
      );
    }else{
      return Text(" ",style: TextStyle(
        color:Colours.sourceColor ,
        fontSize:11 ,
        height: 1.1,
      ), maxLines: 1,);
    }
  }

}

class TypeText extends StatelessWidget{
  final int type;//0是置顶，1是广告，2是普通

  const TypeText(
      this.type

      );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    switch(type){
      case 1:
        return Container(
          margin: EdgeInsets.only(right: 8),
          child:Text("置顶",
            style: TextStyle(
              color: Colors.red,
              fontSize: 11.0,
              height: 1.1,
              fontFamily: "Courier",

            ),
          ),
        );
        break;
      case 2:
        return Container(
            margin: EdgeInsets.only(right: 8),
            child:Text("广告",
              style: TextStyle(
              color: Colours.sourceColor,
              fontSize: 11.0,
              height: 1.1,
              fontFamily: "Courier",
              background: new Paint()..color=Colors.blueGrey,
              decoration:TextDecoration.underline,
              decorationStyle: TextDecorationStyle.dashed
             ),
            ),
        );
        break;
      default:
        return Text("");
        break;

    }

  }}

