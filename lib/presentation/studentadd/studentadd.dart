import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studentlistbloc/application/bottomnavbar/bottomnav_bloc.dart';
import 'package:studentlistbloc/application/studentlist/studentlist_bloc.dart';
import 'package:studentlistbloc/application/userimage/userimage_bloc.dart';
import 'package:studentlistbloc/core/const.dart';
import 'package:studentlistbloc/domain/dbfunction/databasefunction.dart';
import 'package:studentlistbloc/domain/model/studentmode.dart';
import 'package:studentlistbloc/presentation/screennav/ScreenBottomNav.dart';

class ScreenStudentAdd extends StatelessWidget {
   ScreenStudentAdd({super.key});

  final nameoftheStudent = TextEditingController();
    final ageofthestudent = TextEditingController();
    final collageid = TextEditingController();
    final phonenumber = TextEditingController();
    String? imagePath;

  @override
  Widget build(BuildContext context) {
    final Size screensize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Stack(
            children: [
              InkWell(
                onTap: () {
                  takeImage(context);
                },
                child: BlocBuilder<UserimageBloc, UserimageState>(
                  builder: (context, state) {
                    return CircleAvatar(
                      radius: screensize.width * 0.2,
                      backgroundColor: Colors.grey.withOpacity(0.5),
                      backgroundImage: state.imagePth.isEmpty ?const AssetImage(userimage) as ImageProvider:  FileImage(File(state.imagePth))
                    );
                  },
                ),
              ),
              const Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Icon(
                    Icons.add_photo_alternate_outlined,
                    color: Colors.black,
                    size: 40,
                  ))
            ],
          ),
          sizedBoxH10,
          TextFormField(
            controller: nameoftheStudent,
            decoration:const InputDecoration(border: outborder, label: Text("Name")),
          ),
          sizedBoxH10,
          TextFormField(
              controller: ageofthestudent,
              decoration:const
                  InputDecoration(border: outborder, label: Text("Age"))),
          sizedBoxH10,
          TextFormField(
              controller: phonenumber,
              decoration:const InputDecoration(
                  border: outborder, label: Text("Collage id"))),
          sizedBoxH10,
          TextFormField(
              controller: collageid,
              decoration:const InputDecoration(
                  border: outborder, label: Text("phone number"))),
          sizedBoxH10,
          ElevatedButton(
              onPressed: () {
                submitFunction(context);
              },
              child:const Text("Submit"))
        ],
      ),
    );
  }

    void submitFunction(BuildContext context) {
    final studentobj=StudentModel(Name: nameoftheStudent.text, Age: ageofthestudent.text, PhoneNumber: phonenumber.text, collageid: collageid.text, imagepath: imagePath!);
    addStudent(studentobj,context);
    context.read<BottomnavBloc>().add(screenchange(newIndex: 0));
  }

  Future<void> takeImage(BuildContext context) async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imagePath=pickedFile.path;
      context
          .read<UserimageBloc>()
          .add((PickTheImage(newimagepth: pickedFile.path)));
    }
  }
}
