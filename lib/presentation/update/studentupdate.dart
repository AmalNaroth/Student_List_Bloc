import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studentlistbloc/application/bottomnavbar/bottomnav_bloc.dart';
import 'package:studentlistbloc/application/userimage/userimage_bloc.dart';
import 'package:studentlistbloc/core/const.dart';
import 'package:studentlistbloc/domain/dbfunction/databasefunction.dart';
import 'package:studentlistbloc/domain/model/studentmode.dart';
import 'package:studentlistbloc/presentation/G-functions/globalfunctions.dart';

class StudentUpdate extends StatelessWidget {
  StudentModel studentdetatils;
  StudentUpdate({super.key, required this.studentdetatils});

  final nameoftheStudent = TextEditingController();
  final ageofthestudent = TextEditingController();
  final collageid = TextEditingController();
  final phonenumber = TextEditingController();
  String? imagePath;

  @override
  Widget build(BuildContext context) {
    nameoftheStudent.text = studentdetatils.Name;
    collageid.text = studentdetatils.collageid;
    ageofthestudent.text = studentdetatils.Age;
    phonenumber.text = studentdetatils.PhoneNumber;
    imagePath = studentdetatils.imagepath;

    //final Size screensize = MediaQuery.of(context).size;
    context
        .read<UserimageBloc>()
        .add(PickTheImage(newimagepth: studentdetatils.imagepath));
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Padding(
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
                          radius: 80,
                          backgroundColor: Colors.grey.withOpacity(0.5),
                          backgroundImage: state.imagePth.isEmpty
                              ? AssetImage(userimage) as ImageProvider
                              : FileImage(File(state.imagePth)));
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
            formField(nameoftheStudent, Icons.abc, TextInputType.name, 50),
            sizedBoxH10,
            formField(ageofthestudent, Icons.abc, TextInputType.number, 2),
            sizedBoxH10,
            formField(collageid, Icons.abc, TextInputType.name, 10),
            formField(phonenumber, Icons.abc, TextInputType.number, 10),
            sizedBoxH10,
            ElevatedButton(
                onPressed: () {
                  submitFunction(context);
                },
                child: const Text("Submit"))
          ],
        ),
      ),
    );
  }

  void submitFunction(BuildContext context) {
    if (nameoftheStudent.text.isEmpty ||
        ageofthestudent.text.isEmpty ||
        phonenumber.text.isEmpty ||
        collageid.text.isEmpty) {
      snackbarfunction("Enter the all detatils", context);
    } else if (phonenumber.text.length != 10) {
      snackbarfunction("Enter the phone number 10 digit", context);
    } else if (imagePath == null) {
      snackbarfunction("Please pic an image", context);
    } else {
      final studentobj = StudentModel(
          Name: nameoftheStudent.text,
          Age: ageofthestudent.text,
          PhoneNumber: phonenumber.text,
          collageid: collageid.text,
          imagepath: imagePath!,id: studentdetatils.id);
      editStudentdetails(studentobj, studentdetatils.id!, context);
      Navigator.of(context).pop();
      nameoftheStudent.clear();
      ageofthestudent.clear();
      phonenumber.clear();
      collageid.clear();
      imagePath = null;
      snackbarfunction("Form updated", context);
    }
  }

  //imag taking local storage
  Future<void> takeImage(BuildContext context) async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imagePath = pickedFile.path;
      context
          .read<UserimageBloc>()
          .add((PickTheImage(newimagepth: pickedFile.path)));
    }
  }

  formField(TextEditingController controlle, IconData icon, TextInputType input,
      int length) {
    return TextFormField(
      maxLength: length,
      keyboardType: input,
      controller: controlle,
      decoration: InputDecoration(
          // hintText: hint,
          border: OutlineInputBorder(
              // borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10)),
          filled: true,
          fillColor: Colors.white,
          suffixIcon: Icon(
            icon,
            color: Color.fromARGB(255, 20, 136, 82),
          )),
    );
  }
}
