import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:studentlistbloc/application/bottomnavbar/bottomnav_bloc.dart';
import 'package:studentlistbloc/application/search/studentsearch_bloc.dart';
import 'package:studentlistbloc/application/studentlist/studentlist_bloc.dart';
import 'package:studentlistbloc/application/userimage/userimage_bloc.dart';
import 'package:studentlistbloc/domain/dbfunction/databasefunction.dart';
import 'package:studentlistbloc/domain/model/studentmode.dart';
import 'package:studentlistbloc/presentation/screennav/ScreenBottomNav.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if(!Hive.isAdapterRegistered(StudentModelAdapter().typeId)){
    Hive.registerAdapter(StudentModelAdapter());
  }
  await Hive.openBox<StudentModel>("student_db");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    getAllStudents(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BottomnavBloc(),
        ),
        BlocProvider(
          create: (context) => StudentlistBloc(),
        ),
         BlocProvider(
          create: (context) => UserimageBloc(),
        ),
        BlocProvider(
          create: (context) => StudentsearchBloc(),
        )
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: ScreenBottomNav(),
          debugShowCheckedModeBanner: false,
        ),
    );
  }
}
