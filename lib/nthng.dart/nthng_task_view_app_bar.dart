// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:to_do_app/utilities/task_view.dart';

// class TaskViewAppBar extends StatelessWidget implements PreferredSizeWidget {
//   const TaskViewAppBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       height: 150,
//       child: Padding(
//         padding: const EdgeInsets.only(left: 20.0),
//         child: Row(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 20.0),
//               child: GestureDetector(
//                 onTap: () {
//                   Navigator.pop(context);
//                 },
//                 child: Icon(Icons.arrow_back_ios_new),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   // TODO: implement preferredSize
//   Size get preferredSize => const Size.fromHeight(150);
// }
