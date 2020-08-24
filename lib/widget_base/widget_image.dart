import 'package:flutter/material.dart';


/**
 * 图片及ICON
 */
class WidgetImage extends StatelessWidget {
  const WidgetImage ({
    Key key,
    @required this.title,
  }):super(key:key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),

      ),
      body: ListView(
        children: <Widget>[
          Text("通过Image组件来加载并显示图片，数据源可以是asset、文件、内存以及网络"),

          
        ],
      ),
    );
  }
}