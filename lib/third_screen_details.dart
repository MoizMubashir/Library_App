// // This is the body of the third screen.
// import 'package:flutter/material.dart';

// import './data_textfield.dart';
// import './data.dart';

// class DetailsBox extends StatefulWidget {
//   const DetailsBox({Key? key}) : super(key: key);

//   @override
//   _DetailsBoxState createState() => _DetailsBoxState();
// }

// class _DetailsBoxState extends State<DetailsBox> {
//   final List<Data> _userData = [
//     Data(title: 'harry potter', isbnNumber: 07345673, date: DateTime.now())
//   ];

//   final titleController = TextEditingController();
//   final isbnController = TextEditingController();

//   void _addNewData(String txTitle, int txAmount) {
//     final newData =
//         Data(title: txTitle, isbnNumber: txAmount, date: DateTime.now());

//     setState(() {
//       _userData.add(newData);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: [
//         Column(
//           children: [
//             const SizedBox(
//               height: 100,
//             ),
//             Center(
//               // Book details heading
//               child: Container(
//                 height: 50.0,
//                 width: 300.0,
//                 decoration: BoxDecoration(
//                     border: Border.all(
//                       color: Colors.deepPurple,
//                       width: 2,
//                     ),
//                     borderRadius: BorderRadius.circular(30),
//                     color: Colors.deepPurple.shade400),
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: const [
//                       Text(
//                         'Enter The Book Details',
//                         style: TextStyle(
//                           fontSize: 15,
//                           color: Colors.white70,
//                           fontWeight: FontWeight.bold,
//                           letterSpacing: 3.0,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             NewData(_addNewData),
//           ],
//         ),
//       ],
//     );
//   }
// }
