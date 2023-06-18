
import 'package:hive_flutter/adapters.dart';
 part 'studentmode.g.dart';

@HiveType(typeId: 0)
class StudentModel{
  @HiveField(0)
  int? id;
  @HiveField(1)
  String Name;
  @HiveField(2)
  String Age;
  @HiveField(3)
  String PhoneNumber;
  @HiveField(4)
  String collageid;
  @HiveField(5)
  String imagepath;
  StudentModel({required this.Name,required this.Age,required this.PhoneNumber,required this.collageid,required this.imagepath,this.id});
}

List<StudentModel> globalallStudentList=[];