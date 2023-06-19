import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studentlistbloc/application/studentlist/studentlist_bloc.dart';
import 'package:studentlistbloc/core/const.dart';
import 'package:studentlistbloc/domain/dbfunction/databasefunction.dart';
import 'package:studentlistbloc/presentation/studentdetails/studentdetatils.dart';
import 'package:studentlistbloc/presentation/update/studentupdate.dart';

class ScreenStudentListing extends StatelessWidget {
  const ScreenStudentListing({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentlistBloc, StudentlistState>(
      builder: (context, state) {
        getAllStudents(context);
        return state.allStudentListState.isNotEmpty
            ? ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => StudentDetails(
                            personalList: state.allStudentListState[index]),
                      ));
                    },
                    title: Text(state.allStudentListState[index].Name),
                    leading: CircleAvatar(
                      backgroundImage: FileImage(
                          File(state.allStudentListState[index].imagepath)),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () {
                              // editStudentdetails(state.allStudentListState[index],state.allStudentListState[index].id!,context);
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => StudentUpdate(
                                    studentdetatils:
                                        state.allStudentListState[index]),
                              ));
                            },
                            icon: Icon(Icons.edit)),
                        IconButton(
                            onPressed: () {
                              deletestudent(
                                  state.allStudentListState[index].id!,
                                  context);
                            },
                            icon: Icon(Icons.delete))
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return sizedBoxH10;
                },
                itemCount: state.allStudentListState.length)
            : Center(
                child: Text("No data found"),
              );
      },
    );
  }
}
