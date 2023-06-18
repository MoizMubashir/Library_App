// This is only the textfield in third screen. This is responsible for adding the card in the list.
import 'package:flutter/material.dart';

class NewData extends StatefulWidget {
  final Function addData;

  const NewData(this.addData, {Key? key}) : super(key: key);

  @override
  State<NewData> createState() => _NewDataState();
}

class _NewDataState extends State<NewData> {
  final titleController = TextEditingController();

  final isbnController = TextEditingController();

  void submitData() {
    if (titleController.text.isEmpty || isbnController.text.isEmpty) {
      return;
    }
    if (isbnController.text.length > 13 || isbnController.text.length < 13) {
      return;
    }
    widget.addData(titleController.text, int.parse(isbnController.text));
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            // Book name
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: titleController,
              style: const TextStyle(color: Colors.black87),
              textInputAction: TextInputAction.done,
              onSubmitted: (_) => submitData(),
              decoration: InputDecoration(
                labelText: 'Book Name',
                fillColor: Colors.white,
                focusedBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(6.0),
                  borderSide:
                      const BorderSide(color: Colors.deepPurple, width: 5.0),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            // ISBN no.
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: isbnController,
              style: const TextStyle(color: Colors.black87),
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              onSubmitted: (_) => submitData(),
              decoration: const InputDecoration(
                labelText: 'ISBN No.',
                fillColor: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: ButtonTheme(
                    height: 30,
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                        child: const Text('Done',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                        color: Colors.deepPurple,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        onPressed: submitData
                        // {
                        //   //Navigator.pop(context, submitData);
                        // }
                        )),
              )
            ],
          ),
        ],
      ),
    );
  }
}
