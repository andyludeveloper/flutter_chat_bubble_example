import 'package:bubble_chat_app/chat_bubble.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Message {
  final String message;
  final bool isMe;

  Message(this.message, this.isMe);
}

getMessages() => <Message>[
      Message("Hi", true),
      Message("Hi", false),
      Message("How are you?", true),
      Message("Fine, thank you", false)
    ];

class MyApp extends StatelessWidget {
  final messages = getMessages();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) => drawItem(index, context)),
        ),
      ),
    );
  }

  Container drawItem(int index, BuildContext context) {
    return Container(
      alignment:
          messages[index].isMe ? Alignment.centerRight : Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: CustomPaint(
        painter:
            ChatBubble(color: Colors.blueAccent, isMe: messages[index].isMe),
        child: Container(
            width: MediaQuery.of(context).size.width / 2,
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            // decoration: BoxDecoration(
            //     color: Colors.blueAccent,
            //     borderRadius: BorderRadius.all(Radius.circular(20.0))),
            alignment: messages[index].isMe
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: Text(
              messages[index].message,
              style: TextStyle(color: Colors.white),
            )),
      ),
    );
  }
}
