import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studentlistbloc/application/studentlist/studentlist_bloc.dart';
import 'package:studentlistbloc/core/const.dart';
import 'package:studentlistbloc/domain/dbfunction/databasefunction.dart';

class ScreenStudentListing extends StatelessWidget {
  const ScreenStudentListing({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentlistBloc, StudentlistState>(
      builder: (context, state) {
        return ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(state.allStudentListState[index].Name),
                leading: CircleAvatar(backgroundImage: FileImage(File(state.allStudentListState[index].imagepath)),),
              );
            },
            separatorBuilder: (context, index) {
              return sizedBoxH10;
            },
            itemCount: state.allStudentListState.length);
      },
    );
  }
}
