import 'package:flutter/material.dart';


/**
 * StatelessWidget用于不需要维护状态的场景，
 * 它通常在build方法中通过嵌套其它Widget来构建UI，
 * 在构建过程中会递归的构建其嵌套的Widget
 */
class MyStatelessWidget extends StatelessWidget {
  //Widget的构造函数参数应使用命名参数，命名参数中的必要参数要添加@required标注,这样有利于静态代码分析器进行检查。另外，
  // 在继承widget时，第一个参数通常应该是Key，
  // 如果Widget需要接收子Widget，那么child或children参数通常应被放在参数列表的最后
  const MyStatelessWidget({
    Key key,
    @required this.title,
    this.backgroundColor:Colors.grey,
  }):super(key:key);

  //Widget的属性应尽可能的被声明为final，防止被意外改变。
  final String title;
  final Color backgroundColor;

  final String desc = "StatelessWidget用于不需要维护状态的场景，"
      "它通常在build方法中通过嵌套其它Widget来构建UI，"
      "在构建过程中会递归的构建其嵌套的Widget";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
          child: Container(
            color: backgroundColor,
            child: Text(desc),
          ),
      )
    );
  }
}