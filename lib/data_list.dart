// This is the card in which our data (isbn no. , book name, date ) are stored.
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './data.dart';

class DataList extends StatelessWidget {
  final List<Data> userData;

  // ignore: use_key_in_widget_constructors
  const DataList(this.userData);

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      height: 500,
      child: userData.isEmpty
          ? Column(
              children: [
                const Text(
                  'No data has been entered!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                // ignore: sized_box_for_whitespace
                Container(
                    height: 200,
                    child: Image.asset('assets/images/waiting.png'))
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.purple.shade300,
                  shadowColor: Colors.deepPurple.shade600,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 2),
                            image: const DecorationImage(
                                image: AssetImage('assets/images/books1.jpg'),
                                fit: BoxFit.fill),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Book Name: ${userData[index].title}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black),
                          ),
                          Text(
                            'ISBN: ${userData[index].isbnNumber}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black),
                          ),
                          Text(
                            DateFormat.yMMMMd().format(userData[index].date),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
              itemCount: userData.length,
            ),
    );
  }
}
