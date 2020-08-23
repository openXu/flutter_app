import 'package:flutter/material.dart';

import 'WidgetDesc.dart';

/**
 * 基础组件列表页
 */
class WidgetBaseListPage extends StatefulWidget {
  WidgetBaseListPage({Key key, @required this.title}) : super(key: key);
  final String title;
  @override
  PageState createState() => PageState();
}

class PageState extends State<WidgetBaseListPage> {
  List list = [
    "Widget简介",
    "状态管理",
    "文本、字体样式"];

  Widget getItem(int index){
    return GestureDetector(
        child:Container(
          height:40,
          child:Text(list[index]),
        ),
        //item 点击事件
        onTap: (){
          print("点击到第"+index.toString());
          if(index==0){
            Navigator.push( context,
                MaterialPageRoute(builder: (context) {
                  return MyStatelessWidget(title: list[index]);
                }));
          }
        },
        //item 长按事件
//        onLongPress: (){
//          setState(() {
//            _onItemLongPressed(index);
//          });
//          print("长按"+index.toString());
//        }
    );
  }

  @override
  Widget build(BuildContext context) {
    //下划线widget预定义以供复用。
    Widget divider1 = Divider(color: Colors.blue,);
    Widget divider2 = Divider(color: Colors.green);
    return Scaffold(
      appBar: AppBar(
        //页面标题
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.separated(
          itemCount: list.length,
          //列表项构造器
          itemBuilder: (BuildContext context, int index) {
            return getItem(index);
            //ListTile(title: Text(list[index]));
          },
          //分割器构造器
          separatorBuilder: (BuildContext context, int index) {
            return index%2==0?divider1:divider2;
          },
        )
      )
    );
  }
}
