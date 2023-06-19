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
import 'package:studentlistbloc/presentation/G-functions/globalfunctions.dart';
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
    //final Size screensize = MediaQuery.of(context).size;
    context.read<UserimageBloc>().add(PickTheImage(newimagepth: ""));
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
                        radius: 80,
                        backgroundColor: Colors.grey.withOpacity(0.5),
                        backgroundImage: state.imagePth.isEmpty
                            ? const AssetImage(userimage) as ImageProvider
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
          formField(nameoftheStudent, Icons.person, TextInputType.name, 10,
              "Name of the student"),
          sizedBoxH10,
          formField(ageofthestudent, Icons.numbers, TextInputType.number, 2,
              "Age of the student"),
          sizedBoxH10,
          formField(collageid, Icons.perm_identity, TextInputType.name, 10,
              "Collage id"),
          sizedBoxH10,
          formField(phonenumber, Icons.phone, TextInputType.number, 10,
              "Phone number"),
          ElevatedButton(
              onPressed: () {
                submitFunction(context);
              },
              child: const Text("Submit"))
        ],
      ),
    );
  }

  void submitFunction(BuildContext context) {
    if(nameoftheStudent.text.isEmpty || ageofthestudent.text.isEmpty || phonenumber.text.isEmpty || collageid.text.isEmpty){
      snackbarfunction("Enter the other detatils", context);
    }else if(phonenumber.text.length!=10){
      snackbarfunction("Enter the phone number 10 digit", context);
    }else if(imagePath==null){
      snackbarfunction("Pick a image", context);
    }else{
      final studentobj = StudentModel(
          Name: nameoftheStudent.text.trim(),
          Age: ageofthestudent.text.trim(),
          PhoneNumber: phonenumber.text.trim(),
          collageid: collageid.text.trim(),
          imagepath: imagePath!);
      addStudent(studentobj, context);
      context.read<BottomnavBloc>().add(screenchange(newIndex: 0));
      nameoftheStudent.clear();
      ageofthestudent.clear();
      phonenumber.clear();
      collageid.clear();
      imagePath=null;
      snackbarfunction("Form submited", context);
    }
  }

  Future<void> takeImage(BuildContext context) async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imagePath = pickedFile.path;
      context.read<UserimageBloc>().add((PickTheImage(newimagepth: pickedFile.path)));
    }else{
      snackbarfunction("Pick a image", context);
    }
  }

  formField(TextEditingController controlle, IconData icon, TextInputType input,
      int length, String label) {
    return TextFormField(
      maxLength: length,
      keyboardType: input,
      controller: controlle,
      decoration: InputDecoration(
          // hintText: hint,
          label: Text(label),
          border: OutlineInputBorder(
              // borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10)),
          filled: true,
          fillColor: Colors.white,
          suffixIcon: Icon(
            icon,
            color: Colors.black,
          )),
    );
  }
}
