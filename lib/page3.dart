import 'package:flutter/material.dart';
import 'package:lecture2/page1.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

// void main() {
//   runApp(Page3());
// }
//
// class Page3 extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<Page3> {
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//
//           body: Center(
//               child: Column(children: <Widget>[
//                 Container(
//                   margin: EdgeInsets.all(25),
//                   child: FlatButton(
//                     child: Text(
//                       'Button ',
//                       style: TextStyle(fontSize: 20.0),
//                     ),
//                     color: Colors.cyan,
//                     textColor: Colors.black,
//                     onPressed: () {
//                       Navigator.of(context).push(MaterialPageRoute(
//
//                           builder: (context) =>MyApp()));
//                     },
//                   ),
//                 ),
//
//               ]))),
//     );
//   }
// }

class Page3 extends StatelessWidget {
  final Function(int) getIndex;

  Page3({Key key, this.getIndex}) : super(key: key);

  Widget build(BuildContext context) {
    _removeData();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple[50],
          title: Text('Page3', style: TextStyle(color: Colors.purple)),
          centerTitle: true,
        ),
        body: Center(
            child: InkWell(
          child: Icon(
            Icons.reply,
            size: 100,
            color: Colors.purple,
          ),
          onTap: () {
            getIndex(0);
          },
        )));
  }

  _removeData() async {
    final prefs = await  SharedPreferences.getInstance();
    await prefs.clear();
  }
}
