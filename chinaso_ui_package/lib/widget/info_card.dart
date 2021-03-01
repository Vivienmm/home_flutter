import 'package:flutter/material.dart';

import '../res.dart';

/// * @author Suyw
/// * @description:
/// * @date :2021/3/1

class InfoCard extends StatelessWidget{
  final String textUp;
  final String textUpUnit;
  final String textDown;

  const InfoCard(
      this.textUp,
      this.textUpUnit,
      this.textDown,{
        Key key,

      })  :
        super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          child: Row(
            children: [
              Text(textUp,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colours.titleColor,
                  fontSize: 22,
                  fontWeight:FontWeight.bold ,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(" " +textUpUnit,

                style: TextStyle(
                  color: Colours.sourceColor,
                  fontSize: 10,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),

        Text(textDown,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colours.titleColor,
            fontSize: 12,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }


}