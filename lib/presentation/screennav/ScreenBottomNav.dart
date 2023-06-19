import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studentlistbloc/application/bottomnavbar/bottomnav_bloc.dart';
import 'package:studentlistbloc/domain/dbfunction/databasefunction.dart';
import 'package:studentlistbloc/presentation/search/studentsearch.dart';
import 'package:studentlistbloc/presentation/studentadd/studentadd.dart';
import 'package:studentlistbloc/presentation/studentdetails/studentdetatils.dart';
import 'package:studentlistbloc/presentation/studentlisting/studentlisting.dart';

class ScreenBottomNav extends StatelessWidget {
  ScreenBottomNav({super.key});

  List<Widget> totalScreens =  [
    const ScreenStudentListing(),
    StudentSearch(),
    ScreenStudentAdd()
  ];

  List<String> screenNames = const ["Student List","Search", "Add Student"];

  @override
  Widget build(BuildContext context) {
    getAllStudents(context);
    return BlocBuilder<BottomnavBloc, BottomnavState>(
      builder: (context, state) {
        return Scaffold(
           resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: Text(screenNames[state.currentIndex]),
              centerTitle: true,
              backgroundColor: Colors.grey,
            ),
            body: totalScreens[state.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: state.currentIndex,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.grey,
              onTap: (value) {
                context
                    .read<BottomnavBloc>()
                    .add(screenchange(newIndex: value));
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: "Student List"),
                    BottomNavigationBarItem(icon: Icon(Icons.search),label: "Search"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.add), label: "Add Student"),
              ],
            ));
      },
    );
  }
}
