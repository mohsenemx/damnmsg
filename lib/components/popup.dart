// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

String GenericInputPopUp(
    {required BuildContext context,
    required String title,
    required String extraInfo,
    required inputHint,
    required inputTitle}) {
  TextEditingController usernameText = new TextEditingController();
  String username = '';
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              20.0,
            ),
          ),
        ),
        contentPadding: EdgeInsets.only(
          top: 10.0,
        ),
        title: Text(
          title,
          style: TextStyle(fontSize: 24.0),
        ),
        content: Container(
          height: 250,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: usernameText,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: inputHint,
                        labelText: inputTitle),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 55,
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      username = usernameText.text;
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      // fixedSize: Size(250, 50),
                    ),
                    child: Text(
                      "Submit",
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Note'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    extraInfo,
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
  print(username);
  return username;
}
