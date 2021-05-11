import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:lecture2/sv_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'models/sinhvien.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 static  List<SinhVien> _items = [];

  @override
  void initState(){
    super.initState();
    _save();
    getData();
  }

  Future<List<dynamic>> getData() async {
    _items = await read();
  }
  Widget build(BuildContext context) {

    // print(_items.length);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[50],
        title: Text('List student',style: TextStyle(color: Colors.purple),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            //Text(),
            _items.length > 0
                ? Expanded(
                    child: ListView.builder(
                      itemCount: _items.length,
                      itemBuilder: (context, index) {

                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                //builder: (context) => SvPage(sinhvien: sinhvien))
                                builder: (context) =>
                                    SvPage(sinhvien: _items.elementAt(index).toJson())));
                          },
                          splashColor: Colors.deepPurple,
                          child: Card(
                            elevation: 2,
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: NetworkImage(_items.elementAt(index).avatar),
                                      radius: 30.0,
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          _items[index].name,
                                          style: TextStyle(fontSize: 20.0, fontFamily: 'Open_Sans'),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          _items[index].id.toString(),
                                          style: TextStyle(fontSize: 20.0),
                                        )
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),

                          ),
                        );
                      },
                    ),
                  )
                : CircularProgressIndicator()
          ],
        ),
      ),
    );
  }


  Future<List<SinhVien>> read() async {
   final prefs = await SharedPreferences.getInstance();
   final key = 'data';
   final students = prefs.getString(key);
   List<dynamic> data = json.decode(students);
   List<SinhVien> posts =
   data.map((dynamic item) => SinhVien.fromJson(item)).toList();
   return posts;
 }

 Map<String, String> userHeader = {"content-type": "application/json; charset=utf-8", "Accept": "application/json;  charset=utf-8"};

 _save() async {
   final response = await http.get(
       Uri.parse('https://6090a8023847340017021912.mockapi.io/linh/user3'), headers: userHeader);
   final students = response.body;
   List<int> bytes = students.codeUnits;
   String getData = utf8.decode(bytes);
   final prefs = await SharedPreferences.getInstance();
   final key = 'data';
   prefs.setString(key, getData);
 }
}






