// import 'dart:convert';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:dio/dio.dart';
// import 'package:lecture2/models/sinhvien.dart';
//
//
//
// class StudentApi {
//   Dio dio = Dio();
//
//   final String postUrl =
//       'https://6090a8023847340017021912.mockapi.io/linh/user3';
//
//   Future<List<SinhVien>> getPost() async {
//     try {
//       var response = await dio.get(postUrl);
//
//       if (response.statusCode == 200) {
//         List<dynamic> students = await json.decode(response.data);
//
//         List<SinhVien> posts =
//         students.map((dynamic item) => SinhVien.fromJson(item)).toList();
//         return posts;
//       }
//     } catch (e) {
//       return List<SinhVien>();
//     }
//   }
// }
Map<String, String> userHeader = {
  "content-type": "application/json; charset=utf-8",
  "Accept": "application/json;  charset=utf-8"
};
save11() async {
  final response = await http.get(
      Uri.parse('https://6090a8023847340017021912.mockapi.io/linh/user3'),
      headers: userHeader);
  final students = response.body;
  List<int> bytes = students.codeUnits;
  String getData = utf8.decode(bytes);
  final prefs = await SharedPreferences.getInstance();
  final key = 'data';
  prefs.setString(key, getData);
}