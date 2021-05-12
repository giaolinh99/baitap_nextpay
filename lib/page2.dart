import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lecture2/models/sinhvien.dart';
import 'package:lecture2/shared_preferences.dart';
import 'package:lecture2/store/student_store.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


// ------------------done ----------
class Page2 extends StatefulWidget {
  //static List<SinhVien> _items = [];

  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  static List<SinhVien> _items = [];

  Future<List<dynamic>> getData() async {
    _items = await read11();
  }

  bool listType = false;

  @override
  Widget build(BuildContext context) {
    getData();


    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.purple[50],
          title: Text(
            'Images',
            style: TextStyle(color: Colors.purple),
          ),
          centerTitle: true,
          actions: [
            InkWell(
                child: Icon(
                  Icons.linear_scale,
                  color: Colors.purple,
                ),
                onTap: () {
                  setState(() {
                    listType = !listType;
                  });
                }),
          ]),
      body: Center(child: FutureBuilder(builder:
              (BuildContext context, AsyncSnapshot<List<SinhVien>> snapshot) {


        if (_items == null) {
          return CircularProgressIndicator();
        }

        if (listType == false)
          return GridView.count(
            crossAxisCount: 3, //moi hang hien thi 3 anh
            crossAxisSpacing: 10, //khoang cach giua 2 anh
            mainAxisSpacing: 10, //khoang cach giua 2 hang
            children: <Widget>[
              for (var i = 0; i < _items.length; i++)
                Image(
                  //items.elementAt(index).avatar),
                  image: NetworkImage(_items.elementAt(i).avatar),
                  fit: BoxFit.cover,
                )
            ],
          );
        else
          return ListView.builder(
            itemCount: _items.length,
            itemBuilder: (context, item) {
              return ListBody(
                children: [
                  Card(
                      child: Image(
                    image: NetworkImage(_items.elementAt(item).avatar),
                  )),
                ],
              );
            },
          );
      })


          ),
    );
  }

 // //-------------------------done -----------


// class Page2 extends StatefulWidget {
//   final StudentStore studentStore = StudentStore();
//
//   ListAvatar() {
//     studentStore.getStudents();
//     studentStore.changeListType();
//   }
//   @override
//   _Page2State createState() => _Page2State();
// }
//
// class _Page2State extends State<Page2> {
//
//
//
//   bool listType = false;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     widget.studentStore.runReactionDisposer();
//   }
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     widget.studentStore.releaseReaction();
//   }
//   @override
//   Widget build(BuildContext context) {
//     final future = widget.studentStore.students;
//
//
//     return Scaffold(
//       appBar: AppBar(
//           backgroundColor: Colors.purple[50],
//           title: Text(
//             'Images',
//             style: TextStyle(color: Colors.purple),
//           ),
//           centerTitle: true,
//           actions: [
//             InkWell(
//                 child: Icon(
//                   Icons.linear_scale,
//                   color: Colors.purple,
//                 ),
//                 onTap: widget.studentStore.changeListType,),
//           ]),
//       body: Center(child: Observer(
//         builder: (context){
//           bool listType =widget.studentStore.listType;
//           return FutureBuilder(builder:
//               (BuildContext context, AsyncSnapshot<List<SinhVien>> snapshot) {
//
//
//             if (_items == null) {
//               return CircularProgressIndicator();
//             }
//
//             if (listType == false)
//               return GridView.count(
//                 crossAxisCount: 3, //moi hang hien thi 3 anh
//                 crossAxisSpacing: 10, //khoang cach giua 2 anh
//                 mainAxisSpacing: 10, //khoang cach giua 2 hang
//                 children: <Widget>[
//                   for (var i = 0; i < _items.length; i++)
//                     Image(
//                       //items.elementAt(index).avatar),
//                       image: NetworkImage(_items.elementAt(i).avatar),
//                       fit: BoxFit.cover,
//                     )
//                 ],
//               );
//             else
//               return ListView.builder(
//                 itemCount: _items.length,
//                 itemBuilder: (context, item) {
//                   return ListBody(
//                     children: [
//                       Card(
//                           child: Image(
//                             image: NetworkImage(_items.elementAt(item).avatar),
//                           )),
//                     ],
//                   );
//                 },
//               );
//           })
//         },
//       )
//
//
//       ),
//     );
//   }

  // Future<List<SinhVien>> read() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final key = 'data';
  //   final students = prefs.getString(key);
  //   List<dynamic> data = json.decode(students);
  //   List<SinhVien> posts =
  //       data.map((dynamic item) => SinhVien.fromJson(item)).toList();
  //
  //   return posts;
  // }

  // _save() async {
  //   final response = await http.get(
  //       Uri.parse('https://6090a8023847340017021912.mockapi.io/linh/user3'));
  //   final students = response.body;
  //
  //
  //   final prefs = await SharedPreferences.getInstance();
  //   final key = 'data';
  //   prefs.setString(key, response.body);
  // }
}
