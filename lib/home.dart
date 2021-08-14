import 'package:flutter/material.dart';
import 'package:mynote/readCode.dart';

class MyHomeWidget extends StatefulWidget {
  @override
  State<MyHomeWidget> createState() => _MyHomeWidgetState();
}

class _MyHomeWidgetState  extends State<MyHomeWidget>{

  var itemCount=10;
  final ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    ///增加滑动监听
    _scrollController.addListener(() {
      ///判断当前滑动位置是不是到达底部，触发加载更多回调
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        _getData();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        //模拟网络请求
        await Future.delayed(Duration(milliseconds:1000));
        setState(() {
          itemCount=10;
        });
        //结束刷新
        return Future.value(true);
      },
      child: ListView.builder(itemBuilder: (BuildContext context, int index) {

          return index == itemCount - 1 ?Column(
            children: <Widget>[
              ListTile(
                title: Text(
                  "$index 最后一个",
                  maxLines: 1,
                ),
                leading: Image.network(
                  "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fwx3.sinaimg.cn%2Flarge%2F547f46d9ly4gsqmhfbuf1j20u00g2whd.jpg&refer=http%3A%2F%2Fwx3.sinaimg.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1631331999&t=06fd511be31597b7d4c6c526fd103ec4",
                  fit: BoxFit.cover,
                  width: 80,
                  height: 80,
                ),
                subtitle: Text("$index"),
              ),
              Divider(),
              Text("正在加载更多")
            ],
          ): Container(child: Center(child: Text("$index"),),height: 100,);

      },
        itemCount: itemCount,
        controller:_scrollController ,
      ),

    );
  }

  void _getData()async {
    //模拟网络请求
    await Future.delayed(Duration(milliseconds:1000));
    setState(() {
      itemCount+=10;
    });
  }



}


