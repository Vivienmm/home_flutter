import 'package:flutter/material.dart';

/// * @author Suyw
/// * @description:通用无数据页面
/// * @date :2021/3/3

class EmptyView extends StatelessWidget{



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      child:Image(image: AssetImage( 'assets/empty_view.png',package: 'chinaso_ui_package'),) ,
    );
  }


}