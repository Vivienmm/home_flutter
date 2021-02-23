
import 'package:chinaso_ui_package/res.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChinasoImg extends StatelessWidget{
  final String imgUrl;

  const ChinasoImg(
      this.imgUrl, {
        Key key,
      })  :
        super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 67,
      width: 108,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: FadeInImage(
          fit: BoxFit.cover,
          placeholder:
          AssetImage( 'assets/img_default2.jpeg',package: 'chinaso_ui_package'),
          image: NetworkImage(
            imgUrl,
          ),
        ),

      ),
    );

  }


}