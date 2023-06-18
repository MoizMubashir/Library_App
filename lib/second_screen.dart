// second page
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:library_project/user_data.dart';

import './data_textfield.dart';
import './data_list.dart';
import './data.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen(
      {Key? key,
      required String this.usernameHolder,
      required String this.passwordHolder})
      : super(key: key);
  // ignore: prefer_typing_uninitialized_variables
  final usernameHolder;
  // ignore: prefer_typing_uninitialized_variables
  final passwordHolder;

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final List<Data> _userData = [
    //Data(title: 'harry potter', isbnNumber: 0734567343211, date: DateTime.now())
  ];

  void _addNewData(String txTitle, int txAmount) {
    final newData =
        Data(title: txTitle, isbnNumber: txAmount, date: DateTime.now());

    setState(() {
      _userData.add(newData);
    });
  }

  void _startAddNewTrasaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return Column(mainAxisSize: MainAxisSize.max, children: [
            GestureDetector(
              onTap: () {},
              child: NewData(_addNewData),
              behavior: HitTestBehavior.opaque,
            ),
          ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.deepPurple,
          elevation: 0.0,
          actions: [
            IconButton(
              icon: const Icon(
                Icons.add_rounded,
                color: Colors.white,
                size: 35,
              ),
              onPressed: () => _startAddNewTrasaction(context),

              // async {
              //   final newCard = await Navigator.of(context).push(
              //       MaterialPageRoute(
              //           builder: (context) => const ThirdScreen()));
              // },
            )
          ],
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () => Navigator.pop(context, false),
          )),
      body: Column(
        children: [
          // ignore: sized_box_for_whitespace
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.2 - 27,
                  decoration: const BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(36),
                          bottomRight: Radius.circular(36))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Hello ' + widget.usernameHolder + '!',
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          const Text(
            'Here Are The Books You Issued: ',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 22,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
          ),
          const SizedBox(
            height: 15,
          ),
          DataList(_userData),
        ],
      ),
    );
  }
}
