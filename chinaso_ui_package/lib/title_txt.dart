
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitleText extends StatelessWidget{
  final String text;

  const TitleText(
      this.text, {
        Key key,

      })  :
        super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Stack(
     children: <Widget>[
       Text(text,
         textAlign: TextAlign.left,
         style: TextStyle(
         color:  Colors.black12,
         fontSize: 16,
       ),
         maxLines: 2,
         overflow: TextOverflow.ellipsis,
       )
     ],
   );
  }


}