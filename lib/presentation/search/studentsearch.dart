import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studentlistbloc/application/search/studentsearch_bloc.dart';
import 'package:studentlistbloc/application/studentlist/studentlist_bloc.dart';
import 'package:studentlistbloc/core/const.dart';
import 'package:studentlistbloc/domain/model/studentmode.dart';

class StudentSearch extends StatelessWidget {
  StudentSearch({super.key});
  final searchControllor = TextEditingController();
  List<StudentModel> studentDisplay=[];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 60,
            child: CupertinoSearchTextField(
              backgroundColor: Colors.grey.withOpacity(.5),
              prefixIcon: const Icon(
                CupertinoIcons.search,
                color: Colors.grey,
              ),
              suffixIcon: const Icon(
                CupertinoIcons.xmark_circle_fill,
                color: Colors.grey,
              ),
              style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
              controller: searchControllor,
              onChanged: (value) {
                searchThevalues(value,context);
              },
            ),
          ),
        ),
        Expanded(
          child: BlocBuilder<StudentsearchBloc, StudentsearchState>(
            builder: (context, state) {
              return state.studentsearchresult.isNotEmpty ? 
              ListView.builder(
                itemCount: state.studentsearchresult.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: FileImage(File(state.studentsearchresult[index].imagepath)),
                    ),
                    title: Text(state.studentsearchresult[index].Name),
                  );
                },
              ): 
              Center(child: Text("No data found"),); 
            },
          ),
        )
      ],
    );
  }
  void searchThevalues(String values,BuildContext context){
     studentDisplay = globalallStudentList.where((element) =>element.Name.toLowerCase().contains(values.toLowerCase())).toList();
        context.read<StudentsearchBloc>().add(NewStudentSearch(newstudentsearchlist: studentDisplay));
  }
}
