// import 'package:flutter/material.dart';

// Widget deleteAlert(BuildContext context, key) {
//     showDialog(
//       context: context,
//       builder: (ctx) => AlertDialog(
//         content: const Text('Do you want to delete your data'),
//         actions: [
//           TextButton(
//               onPressed: () {
//                 deleteStudent(key);
//                 Navigator.of(context).pop(ctx);
//               },
//               child: const Text(
//                 'Delete',
//                 style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
//               )),
//           TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop(ctx);
//               },
//               child: const Text(
//                 'Cancel',
//                 style: TextStyle(color: Colors.black),
//               ))
//         ],
//       ))

import 'package:flutter/material.dart';

void snackbarfunction(String value, BuildContext context){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value)));
}