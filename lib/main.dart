// ignore_for_file: prefer_const_constructors, avoid_print, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:drad_drop_list_tut/color_game.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: ColorGame(),
    );
  }
}

// class DragScreen extends StatefulWidget {
//   const DragScreen({Key? key}) : super(key: key);

//   @override
//   _DragScreenState createState() => _DragScreenState();
// }

// class _DragScreenState extends State<DragScreen> {
//   bool insideTarget = false;
//   String activeEmoji = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text('Inside Target? $insideTarget'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             DragTarget<String>(
//               builder: (context, data, rejectedData) {
//                 return Container(
//                   width: 200,
//                   height: 200,
//                   color: Colors.blue,
//                   child: activeEmoji == ''
//                       ? null
//                       : FruitBox(boxIcon: activeEmoji, boxColor: Colors.blue),
//                 );
//               },
//               onAccept: (emoji) {
//                 setState(() {
//                   insideTarget = true;
//                   activeEmoji = emoji;
//                 });
//               },
//               onWillAccept: (emoji) {
//                 return emoji == '' ? false : true;
//               },
//               onLeave: (emoji) {
//                 setState(() {
//                   insideTarget = false;
//                   activeEmoji = '';
//                 });
//               },
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 FruitBox(boxIcon: '🍎', boxColor: Colors.green),
//                 FruitBox(boxIcon: '🍌', boxColor: Colors.yellow),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class FruitBox extends StatelessWidget {
//   final String boxIcon;
//   final Color boxColor;

//   FruitBox({required this.boxIcon, required this.boxColor});

//   @override
//   Widget build(BuildContext context) {
//     return Draggable(
//       data: boxIcon,
//       child: Container(
//         height: 120,
//         width: 120,
//         color: boxColor,
//         child: Center(
//           child: Text(
//             boxIcon,
//             style: TextStyle(
//               fontSize: 50,
//             ),
//           ),
//         ),
//       ),
//       feedback: Material(
//         child: Container(
//           height: 120,
//           width: 120,
//           color: boxColor,
//           child: Center(
//             child: Text(
//               boxIcon,
//               style: TextStyle(
//                 fontSize: 50,
//               ),
//             ),
//           ),
//         ),
//       ),
//       childWhenDragging: Container(
//         height: 120,
//         width: 120,
//         color: Colors.grey,
//       ),
//     );
//   }
// }
