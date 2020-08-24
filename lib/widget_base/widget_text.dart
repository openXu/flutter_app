import 'package:flutter/material.dart';


/**
 * 文本及样式
 */
class WidgetText extends StatelessWidget {
  const WidgetText({
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
          Text("Text用于显示简单样式文本，它包含一些控制文本显示样式的一些属性。"),
          Text("textAlign -- 文本的对齐方式，左对齐、右对齐还是居中。只有Text宽度大于文本内容长度时指定此属性才有意义",
              textAlign:TextAlign.center),
          Text("maxLines、overflow -- 文本显示的最大行数和截断方式。TextOverflow.ellipsis，它会将多余文本截断后以省略符“...”表示",
              maxLines:2,
              overflow:TextOverflow.ellipsis),
          Text("textScaleFactor -- 文本相对于当前字体大小的缩放因子(默认值1)，相对于style属性的fontSize",
              textScaleFactor: 0.8),
          Text("style -- TextStyle指定文本显示的样式如颜色、字体、粗细、背景"),
          Text("color、fontSize -- 文字颜色和大小",
            style: TextStyle(
                color: Colors.blue,
                fontSize: 18.0,
            ),
          ),
          Text("height:1.2 -- 设置Text高度因子，高度=height*fontSize",
            style: TextStyle(
                fontSize: 14.0,
                height: 1.2,
            ),
          ),
          Text("fontFamily -- 字体集",
            style: TextStyle(
                fontFamily: "Courier",
            ),
          ),
          Text("background -- 背景色",
            style: TextStyle(
                background: new Paint()..color=Colors.yellow,
            ),
          ),
          Text("decoration -- 装饰",
            style: TextStyle(
              decoration: TextDecoration.underline,
            ),
          ),
          Text("decorationColor -- 装饰颜色",
            style: TextStyle(
              decoration: TextDecoration.underline,
              decorationColor: Colors.red,
                decorationStyle:TextDecorationStyle.dashed// 线的样式 默认实线
            ),
          ),
          Text(
            "fontWeight: FontWeight.w60 -- 字体加粗",
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            'fontStyle: FontStyle.italic -- 斜体',
            style: new TextStyle(
              fontStyle: FontStyle.italic,
            ),
          ),
          Text(""),

          Text(
            'letterSpacing: 10.0 -- 字符间距',
            style: new TextStyle(
              letterSpacing: 10.0,
              // wordSpacing: 15.0
            ),
          ),
          Text(
            'wordSpacing: 15.0 -- 字或单词间距',
            style: new TextStyle(
              wordSpacing: 15.0,
            ),
          ),
          /**TextSpan*/
          Text.rich(TextSpan(
              children: [
                TextSpan(
                    text: "Text.rich(TextSpan())文本分段: "
                ),
                TextSpan(
                    text: "https://flutterchina.club",
                    style: TextStyle(
                        color: Colors.blue
                    ),
                ),
              ]
          )),

          DefaultTextStyle(
            //1.设置文本默认样式
            style: TextStyle(
              color:Colors.red,
              fontSize: 20.0,
            ),
            textAlign: TextAlign.start,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("DefaultTextStyle设置默认文本样式"),
                Text("DefaultTextStyle设置默认文本样式"),
                Text("不继承默认样式",
                  style: TextStyle(
                      inherit: false, //2.不继承默认样式
                      color: Colors.grey
                  ),
                ),
              ],
            ),
          ),


        ],
      ),
    );
  }
}