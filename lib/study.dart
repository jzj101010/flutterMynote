import 'package:flutter/material.dart';
import 'package:mynote/readCode.dart';

import 'httpdemo.dart';

Map listMap = {
  "常用布局布局的 Widget": "isTitleUnEnableClick",
  "Container": "只有⼀个⼦ Widget。默认充满，包含了padding、margin、color、宽⾼、decoration 等配置。",
  "Padding": "只有⼀个⼦ Widget。只⽤于设置Padding，常⽤于嵌套child，给child设置padding。",
  "Center": "只有⼀个⼦ Widget。只⽤于居中显示，常⽤于嵌套child，给child设置居中。",
  "Stack": "可以有多个⼦ Widget。 ⼦Widget堆叠在⼀起。",
  "Column": "可以有多个⼦ Widget。垂直布局。",
  "Row": "可以有多个⼦ Widget。⽔平布局。",
  "Expanded": "只有⼀个⼦ Widget。在 Column 和 Row 中充满。flex默认为1(比重)",
  "ListView": "可以有多个⼦ Widget--列表",
  "GridView": "可以有多个⼦ Widget--网格",
  "Wrap": "可以有多个子 Widget --流布局，主方向(mainAxis)上空间不足时，能够自动换行",
  "交互显示的和完整⻚⾯呈现的 Widget": "isTitleUnEnableClick",
  "MaterialApp": "⼀般作为APP顶层的主⻚⼊⼝，可配置主题，多语⾔，路由等",
  "Scaffold":
      "⼀般⽤户⻚⾯的承载Widget，包含appbar、snackbar、drawer等material design的设定。（脚手架）",
  "Appbar": "⼀般⽤于Scaffold的appbar ，内有标题，⼆级⻚⾯返回按键等，当然不⽌这些，tabbar等也会需要它 。",
  "Text": "显示⽂本，⼏乎都会⽤到，主要是通过style设置TextStyle来设置字体样式等。",
  "RichText": "富⽂本，通过设置 TextSpan ，可以拼接出富⽂本场景",
  "TextField": "⽂本输⼊框 ： new TextField(controller: //⽂本控制器, obscureText:hint⽂本)",
  "Image":

  "图⽚加载: new FadeInImage.assetNetwork( placeholder: \"预览图\", fit:BoxFit.fitWidth, image: \"url\")",
  "FlatButton": "按键点击: new FlatButton(onPressed: () {},child: new Container())",
  "网络请求demo": "isTitleUnEnableClick",
  "http 库":"网络请求库",
  "Dio 库":"网络请求库",


};

class MyStudyWidget extends StatelessWidget {
  void pushPage(BuildContext context, String string) {
    if (listMap[string] == "isTitleUnEnableClick") {
      return;
    }

    var pushWidget;
    switch (string) {
      case "Container":
        pushWidget = ContainerStudy();
        break;
      case "Column":
        pushWidget = ColumnStudy();
        break;
      case "Padding":
        pushWidget = PaddingStudy();
        break;
      case "Center":
        pushWidget = CenterStudy();
        break;
      case "Stack":
        pushWidget = StackStudy();
        break;
      case "Row":
        pushWidget = RowStudy();
        break;
      case "Expanded":
        pushWidget = ExpandedStudy();
        break;
      case "ListView":
        pushWidget = MyStudyWidget();
        break;
      case "GridView":
        pushWidget = GridViewStudy();
        break;
      case "Text":
        pushWidget = TextStudy();
        break;
      case "RichText":
        pushWidget = TextStudy();
        break;
      case "TextField":
        pushWidget = TextStudy();
        break;
      case "Image":
        pushWidget = StackStudy();
        break;

      case "http 库":
        pushWidget = HttpStudyWidget();
        break;

    }

    Navigator.push(context, MaterialPageRoute<void>(
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text(string),
            ),
          ),
          body: pushWidget,
        );
      },
    ));
  }

  void showIntroDialog(BuildContext context, str) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(content: Text(listMap[str]), actions: <Widget>[
            FlatButton(
              child: const Text('进入详情'),
              onPressed: () {
                Navigator.pop(context);
                pushPage(context, str);
              },
            ),
          ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("ListView"),
      ),
      body: ListView.builder(
        itemCount: listMap.keys.length,
        itemBuilder: (BuildContext context, int index) {
          var str = listMap.keys.toList()[index];
          return GestureDetector(
            child: Center(
                child: Padding(
              padding: EdgeInsets.all(10),
              child: Text(str,
                  style: TextStyle(
                    fontSize: 20,
                    color: listMap[str] == "isTitleUnEnableClick"
                        ? Colors.black
                        : Colors.blue,
                  )),
            )),
            onTap: () {
              showIntroDialog(context, str);
            },
            onLongPress: () {
              pushPage(context, str);
            },
          );
        },
      ),
    );
  }
}

class ContainerStudy extends StatelessWidget {
  ContainerStudy({Key? key}) : super(key: key);
  var codeContent = "Container(\n"
      "   ///四周10⼤⼩的maring\n"
      "   margin: const EdgeInsets.all(10.0),\n"
      "   // height: 120.0,\n"
      "   width: 500.0,\n"
      "   ///透明⿊⾊遮罩\n"
      "   decoration: BoxDecoration(\n"
      "        ///弧度为4.0\n"
      "        borderRadius: const BorderRadius.all(Radius.circular(4.0)),\n"
      "        ///设置了decoration的color，就不能设置Container的color。\n"
      "        color: Colors.white,\n"
      "        ///边框\n"
      "        border: Border.all(color: const Color(0xff3075fe), width: 1)),\n"
      "   child: const Text(codeContent, \n"
      "        style: TextStyle(\n"
      "        fontSize: 15,\n"
      "        color: Colors.black,\n"
      ")));";

  @override
  Widget build(BuildContext context) {
    return Container(

        ///四周10⼤⼩的maring
        margin: const EdgeInsets.all(10.0),
        // height: 120.0,
        width: 500.0,

        ///透明⿊⾊遮罩
        decoration: BoxDecoration(

            ///弧度为4.0
            borderRadius: const BorderRadius.all(Radius.circular(4.0)),

            ///设置了decoration的color，就不能设置Container的color。
            color: Colors.white,

            ///边框
            border: Border.all(color: const Color(0xff3075fe), width: 1)),
        child: Text(codeContent,
            style: TextStyle(
              fontSize: 10,
              color: Colors.black,
            )));
  }
}

///Padding Start
class PaddingStudy extends StatelessWidget {
  var codeContent = "PaddingStudy";

  @override
  Widget build(BuildContext context) {
    return Padding(
      ///EdgeInsets 用于设置内边距的value值
      padding: const EdgeInsets.only(left: 100.0, top: 50),
      child: Text(
        codeContent,
        style: TextStyle(
          fontSize: 10,
          color: Colors.black,
        ),
      ),
    );
  }
}

///Padding Start

///Center Start
class CenterStudy extends StatelessWidget {
  var codeContent = "CenterStudy";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        codeContent,
        style: TextStyle(
          fontSize: 10,
          color: Colors.black,
        ),
      ),
    );
  }
}

///Center Start

///Stack Start
class StackStudy extends StatelessWidget {
  var codeContent = "StackStudy";

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image(
            fit: BoxFit.fitWidth,
            // width: double.infinity,
            // height: double.infinity,
            image: NetworkImage(
                "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fwx3.sinaimg.cn%2Flarge%2F547f46d9ly4gsqmhfbuf1j20u00g2whd.jpg&refer=http%3A%2F%2Fwx3.sinaimg.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1631331999&t=06fd511be31597b7d4c6c526fd103ec4")),
        Text(
          codeContent,
          style: TextStyle(
            fontSize: 20,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}

///Stack Start

///ColumnStudy Start
class ColumnStudy extends StatelessWidget {
  var codeContent = "ColumnStudy";

  @override
  Widget build(BuildContext context) {
    return Column(
      ///主轴居中,即是竖直向居中
      mainAxisAlignment: MainAxisAlignment.center,

      ///⼤⼩按照最⼩显示
      mainAxisSize: MainAxisSize.min,

      ///横向也居中
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        ///flex默认为1(比重)
        new Expanded(
          child: new Text(codeContent + "第一个flex: 5"),
          flex: 5,
        ),
        new Expanded(child: new Text(codeContent + "flex: 默认1")),
        new Expanded(child: new Text(codeContent + "2222")),
        new Expanded(child: new Text(codeContent + "2222")),
        new Expanded(child: new Text(codeContent + "2222")),
        new Expanded(child: new Text(codeContent + "2222")),
      ],
    );
  }
}

///ColumnStudy End

///RowStudy Start
class RowStudy extends StatelessWidget {
  var codeContent = "RowStudy";

  @override
  Widget build(BuildContext context) {
    return Row(
      ///主轴居中,即是竖直向居中
      mainAxisAlignment: MainAxisAlignment.center,

      ///⼤⼩按照最⼩显示
      mainAxisSize: MainAxisSize.min,

      ///副轴也居中
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        ///flex默认为1(比重)
        new Expanded(
          child: new Text(codeContent + "第一个flex: 5"),
          flex: 5,
        ),
        new Expanded(child: new Text(codeContent + "flex: 默认1")),
        new Expanded(child: new Text(codeContent + "")),
        new Expanded(child: new Text(codeContent + "")),
        new Expanded(child: new Text(codeContent + "")),
        new Expanded(child: new Text(codeContent + "")),
      ],
    );
  }
}

///RowStudy End

///ExpandedStudy Start
class ExpandedStudy extends StatelessWidget {
  var codeContent = "ExpandedStudy";

  @override
  Widget build(BuildContext context) {
    return Column(
      ///主轴居中,即是竖直向居中
      mainAxisAlignment: MainAxisAlignment.start,

      ///⼤⼩按照最⼩显示
      mainAxisSize: MainAxisSize.min,

      ///横向也居中
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        ///flex默认为1(比重)
        new Expanded(
          child: new Text(codeContent +
              "Column第一个flex: 2\n" +
              "Column（Row（Expanded（Text）））"),
          flex: 2,
        ),
        new RowStudy(),
        new RowStudy(),
        new RowStudy(),
        new RowStudy(),
        new RowStudy(),
      ],
    );
  }
}

///ExpandedStudy End

///Text Start
class TextStudy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      ///主轴居中,即是竖直向居中
      mainAxisAlignment: MainAxisAlignment.center,

      ///⼤⼩按照最⼩显示
      mainAxisSize: MainAxisSize.max,

      ///副轴也居中
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("我是一个Text"),
        RichText(
            text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <InlineSpan>[
              TextSpan(text: '我是', style: TextStyle(color: Colors.red)),
              TextSpan(text: '一个', style: TextStyle(color: Colors.blue)),
              TextSpan(
                  text: 'RichText富文本', style: TextStyle(color: Colors.black)),
            ])),
        Padding(
          padding: EdgeInsets.all(20),
          child: TextField(
            decoration: InputDecoration(
                labelText: "悬浮提示内容",
                helperText: "帮助内容",
                hintText: "输入提示 这是一个TextField",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
        )
      ],
    );
  }
}

///Gridv    Start
class GridViewStudy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: listMap.keys.length,
        itemBuilder: (context, index) {
          return Container(
            ///透明⿊⾊遮罩
            decoration: BoxDecoration(

              ///弧度为4.0
                borderRadius: const BorderRadius.all(Radius.circular(4.0)),

                ///设置了decoration的color，就不能设置Container的color。
                color: Colors.white,

                ///边框
                border: Border.all(color: const Color(0xff3075fe), width: 1))
            ,child: Center(child: Text("第" + index.toString() + "个grid"),));
          // return Text(listMap.keys.toList()[index]);
        },
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4));
  }
}
