import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpStudyWidget extends StatefulWidget {
  // @override
  // State<HttpStudyWidget> createState() {
  //   return _HttpStudyWidgetState();
  // }

  @override
  State<HttpStudyWidget> createState() => _HttpStudyWidgetState();
}

class _HttpStudyWidgetState extends State<HttpStudyWidget> {
  var getContent = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(getContent),
        ElevatedButton(
            onPressed: () {
              _getData();
            },
            child: Text("get请求"))
      ],
    );
  }

  _getData() async {
    // var apiurl = Uri.parse("https://jd.itying.com/api/httpGet");
    var apiurl = Uri.parse('https://wanandroid.com/wenda/comments/14500/json');
    var response = await http.get(apiurl);
    print(response.body);
    setState(() {
      getContent=response.body;
    });
  }
}
