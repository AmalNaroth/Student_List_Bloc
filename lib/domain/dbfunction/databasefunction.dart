import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:studentlistbloc/application/studentlist/studentlist_bloc.dart';
import 'package:studentlistbloc/domain/model/studentmode.dart';

Future<void> addStudent(StudentModel value,BuildContext context) async{
  final studentDb=await Hive.openBox<StudentModel>("student_db");
  final _id= await studentDb.add(value);
  final newvalue = StudentModel(Name: value.Name, Age: value.Age, PhoneNumber: value.PhoneNumber, collageid: value.collageid, imagepath: value.imagepath,id: _id);
  studentDb.put(_id, newvalue);
  //value.id=_id;
  //samplefunction();
  getAllStudents(context);
}

// Future<void> samplefunction() async{
//   final studentdb=await Hive.openBox<StudentModel>("student_db");
//   for(var values in studentdb.values){
//     print(values.imagepath);
//   }
// }

Future<void> getAllStudents(BuildContext context,) async{
  final studentdb=await Hive.openBox<StudentModel>("student_db");
  globalallStudentList.clear();
  globalallStudentList.addAll(studentdb.values);
  context.read<StudentlistBloc>().add(addingNewStudentslist(Newlist: globalallStudentList));
}

Future<void> editStudentdetails(StudentModel value,int id,BuildContext context) async{
  final studentdb=await Hive.openBox<StudentModel>("student_db");
  studentdb.put(id, value);
  getAllStudents(context);
}

Future<void> deletestudent(int id,BuildContext context) async{
  final studentdb=await Hive.openBox<StudentModel>("student_db");
  studentdb.delete(id);
  getAllStudents(context);
}