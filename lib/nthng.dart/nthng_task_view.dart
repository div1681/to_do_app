// import 'package:flutter/material.dart';
// import 'package:to_do_app/utilities/AppStr.dart';
// import 'package:to_do_app/utilities/task_view_app_bar.dart';

// class TaskView extends StatefulWidget {
//   const TaskView({super.key});

//   @override
//   State<TaskView> createState() => _TaskViewState();
// }

// class _TaskViewState extends State<TaskView> {
//   @override
//   Widget build(BuildContext context) {
//     var texttheme = Theme.of(context).textTheme;
//     return Scaffold(
//       appBar: TaskViewAppBar(),

//       body: SizedBox(
//         width: double.infinity,
//         height: double.infinity,
//         child: Column(
//           children: [
//             SizedBox(
//               width: double.infinity,
//               height: 100,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   SizedBox(width: 70, child: Divider(thickness: 2)),
//                   RichText(
//                     text: TextSpan(
//                       text: AppStr.addNewTask,
//                       style: texttheme.titleLarge,
//                       children: [
//                         TextSpan(
//                           text: AppStr.taskString,
//                           style: TextStyle(fontWeight: FontWeight.w400),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(width: 70, child: Divider(thickness: 2)),
//                 ],
//               ),
//             ),

//             SizedBox(
//               width: double.infinity,
//               height: 535,
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.only(left: 30),
//                     child: Text(
//                       AppStr.titleOfTitleTextField,
//                       style: texttheme.headlineMedium,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
