// import 'package:flutter/material.dart';

// class TaskWidget extends StatelessWidget {
//   const TaskWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final bgColor = theme.colorScheme.surface;
//     final textColor = theme.textTheme.bodyMedium?.color ?? Colors.black;
//     final hintColor = theme.hintColor;

//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//       padding: const EdgeInsets.all(18),
//       decoration: BoxDecoration(
//         color: bgColor,
//         borderRadius: BorderRadius.circular(24),
//         boxShadow: [
//           BoxShadow(
//             color: theme.shadowColor.withOpacity(0.08),
//             blurRadius: 12,
//             offset: const Offset(0, 6),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Task Title
//           Text(
//             "Design UI for HomePage",
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.w700,
//               color: textColor,
//             ),
//           ),

//           const SizedBox(height: 8),

//           // Task Description
//           Text(
//             "Make the homepage follow the sign-in style, clean and consistent.",
//             style: TextStyle(fontSize: 14, color: hintColor),
//           ),

//           const SizedBox(height: 12),

//           // Task Footer (Time + Tag)
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               // Time
//               Row(
//                 children: [
//                   Icon(Icons.access_time, size: 18, color: hintColor),
//                   const SizedBox(width: 4),
//                   Text(
//                     "Due: Tomorrow",
//                     style: TextStyle(color: hintColor, fontSize: 13),
//                   ),
//                 ],
//               ),

//               // Tag
//               Container(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 10,
//                   vertical: 4,
//                 ),
//                 decoration: BoxDecoration(
//                   color: theme.colorScheme.primary.withOpacity(0.1),
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Text(
//                   "UI/UX",
//                   style: TextStyle(
//                     fontSize: 12,
//                     fontWeight: FontWeight.bold,
//                     color: theme.colorScheme.primary,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
