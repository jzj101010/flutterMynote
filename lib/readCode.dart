import 'dart:io';

class ReadCode {
  var content = "";

  ReadCode() {
    readContent();
  }

  void readContent() async {

    var filePath = "study.dart";
    try {
      File file = new File(filePath);
     var  content = await file.readAsString();

      print(content);
    } catch (e) {
      print(e);
    }
  }
}
