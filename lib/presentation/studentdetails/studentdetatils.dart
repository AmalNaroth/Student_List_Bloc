import 'dart:io';
import 'package:flutter/material.dart';
import 'package:studentlistbloc/core/const.dart';
import 'package:studentlistbloc/domain/model/studentmode.dart';

class StudentDetails extends StatelessWidget {
  StudentModel? personalList;
   StudentDetails({super.key, this.personalList});

  @override
  Widget build(BuildContext context,) {
    final Size screensize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Personal detatils"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.edit))
        ],
      ),
      body:  SizedBox(
        width: double.infinity,
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Student image",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
        CircleAvatar(radius: screensize.width*0.3,
        backgroundImage: FileImage(File(personalList!.imagepath)),),
        sizedBoxH10,
        Text("Name:"+personalList!.Name,style: TextStyle(fontSize: 20),),
         sizedBoxH10,
        Text("Age"+personalList!.Age,style: TextStyle(fontSize: 20)),
         sizedBoxH10,
        Text("Collage id"+personalList!.collageid,style: TextStyle(fontSize: 20)),
         sizedBoxH10,
        Text("Phone number"+personalList!.PhoneNumber,style: TextStyle(fontSize: 20)),
          ],),
      ),
    );
  }
}