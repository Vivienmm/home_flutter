import 'package:flutter/cupertino.dart';

/// * @author Suyw
/// * @description:
/// * @date :2021/3/16
 class MediaNewsPage extends StatefulWidget{

   String type;
   MediaNewsPage({this.type});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createStareturn  throw UnimplementedError();
    return MediaNewsPageState (mediaType: type);
  }

 }

class MediaNewsPageState extends State<MediaNewsPage> {

   String mediaType;
  MediaNewsPageState({this.mediaType});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child:Text(mediaType),
    );
  }

}