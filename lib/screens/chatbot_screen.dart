import 'dart:convert';

import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class Chatbot_Screen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _Chatbot_Screen createState() => _Chatbot_Screen();
}

// ignore: camel_case_types
class _Chatbot_Screen extends State<Chatbot_Screen> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  List<String> _data = [];
  static const String BOT_URL = "https://wisha-chatbot.herokuapp.com/bot";
  TextEditingController queryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text('Chatbot'),
      ),
      body: Stack(
        children: <Widget>[
          AnimatedList(
            key: _listKey,
            initialItemCount: _data.length,
            itemBuilder:
                (BuildContext context, int index, Animation<double> animation) {
              return buildItem(_data[index], animation, index);
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ColorFiltered(
              colorFilter: ColorFilter.linearToSrgbGamma(),
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                    // ignore: prefer_const_constructors
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    // ignore: prefer_const_constructors
                    decoration: InputDecoration(
                      // ignore: prefer_const_constructors
                      icon: Icon(
                        Icons.message,
                        color: Colors.blue,
                      ),
                      hintText: "¡Hola Bot!",
                      fillColor: Colors.white12,
                    ),
                    controller: queryController,
                    textInputAction: TextInputAction.send,
                    onSubmitted: (msg) {
                      getResponse();
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void getResponse() {
    if (queryController.text.length > 0) {
      this.insertSingleItem(queryController.text);
      var client = getClient();
      try {
        // ignore: avoid_single_cascade_in_expression_statements
        client.post(
          Uri.parse(BOT_URL),
          body: {'query': queryController.text},
        )..then((response) {
            print(response.body);
            Map<String, dynamic> data = jsonDecode(response.body);
            insertSingleItem(data['response'] + '<bot>');
          });
      } finally {
        client.close();
        queryController.clear();
      }
    }
  }

  void insertSingleItem(String message) {
    _data.add(message);
    _listKey.currentState?.insertItem(_data.length - 1);
  }

  http.Client getClient() {
    return http.Client();
  }
}

Widget buildItem(String item, Animation<double> animation, int index) {
  bool mine = item.endsWith("<bot>");
  return SizeTransition(
    sizeFactor: animation,
    child: Padding(
      padding: EdgeInsets.only(top: 10),
      child: Container(
        alignment: mine ? Alignment.topLeft : Alignment.topRight,
        child: Bubble(
          // ignore: sort_child_properties_last
          child: Text(
            item.replaceAll("<bot>", ""),
            style: TextStyle(color: mine ? Colors.white : Colors.black),
          ),
          color: mine ? Colors.blue : Colors.grey[200],
          padding: BubbleEdges.all(10),
        ),
      ),
    ),
  );
}
