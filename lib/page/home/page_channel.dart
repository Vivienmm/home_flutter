import 'dart:ui';

import 'package:chinaso_ui_package/res.dart';
import 'package:flutter/material.dart';
import 'package:home_flutter/http/channel_item.dart';
import 'package:home_flutter/ui/channel_grid.dart';

class ChannelPage extends StatefulWidget {
  @override
  _MyState createState() => _MyState();
}

class _MyState extends State<ChannelPage> {
 // PageController controller;
  int _currentSelect = 0;
  void onSelect(int index) {
    setState(() {
      _currentSelect = index;
      //controller.animateToPage(index,duration: Duration(milliseconds: 400),curve: Curves.easeInOut);
    });
  }

  @override
  void initState() {
   // controller =
   //     PageController(initialPage: 0, keepPage: true, viewportFraction: 2.0);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
   // controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<ChannelItem> items=new List<ChannelItem>();
    items.add(new ChannelItem("新闻","assets/channel/channel_news.png"));
    items.add(new ChannelItem("图片","assets/channel/channel_img.png"));
    items.add(new ChannelItem("视频","assets/channel/channel_video.png"));
    items.add(new ChannelItem("青少年","assets/channel/channel_young.png"));
    items.add(new ChannelItem("好故事","assets/channel/channel_story.png"));
    items.add(new ChannelItem("App","assets/channel/channel_app.png"));
    items.add(new ChannelItem("区块链","assets/channel/channel_chain.png"));
    items.add(new ChannelItem("游戏","assets/channel/channel_game.png"));
    items.add(new ChannelItem("Chinaso Story","assets/channel/channel_eng.png"));

    final width = window.physicalSize.width;
    const _defaultColor = Colours.indicatorUnSelectedColor;
    const _selectColor = Colours.indicatorSelectedColor;
    return Container(

      color:Colors.white,
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize :MainAxisSize.max,

        children: [


         Container(

        alignment: Alignment.center,
        width:window.physicalSize.width,
        height:60,

           //child:PageItem(items),
           child: PageView(

             children: [

              PageItem(items),
              PageItem(items),

          ],

         //controller存在滑动冲突问题
         // controller: controller,
          physics: AlwaysScrollableScrollPhysics(),
          onPageChanged: (value) {
               print("滑动"+value.toString());
            onSelect(value);

            print(value);
          },
        ),
      ),

          Container(

            width: 45,
            height:40,

            child:BottomNavigationBar(

              elevation: 0,
              backgroundColor:Colors.white,
              items: [

                BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage('assets/bottom_indicator_selected.png'),
                  ),
                  title:  new Container(),
                ),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/bottom_indicator_selected.png'),
                    ),
                    title: new Container()),

              ],
              unselectedItemColor: _defaultColor,
              selectedItemColor: _selectColor,
              currentIndex: _currentSelect,
              onTap: (index) => onSelect(index),
              type: BottomNavigationBarType.fixed,
            ),
          ),
        ],
      ),
    );


  }
}

