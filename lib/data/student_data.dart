import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:lecture2/models/sinhvien.dart';
class StudentData {
   Future<dynamic> getStudent() async{
      var students = await http.get(Uri.parse("uri"));
      // map reponse data =-> list student
      return students;

    }
}