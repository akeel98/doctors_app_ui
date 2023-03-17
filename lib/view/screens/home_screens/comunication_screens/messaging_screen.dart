import 'package:doctors/consts/colors.dart';
import 'package:flutter/material.dart';

class MessagingScreen extends StatelessWidget {
  final String doctorName;
  final String doctorImg;
  const MessagingScreen({super.key, required this.doctorName, required this.doctorImg});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: CircleAvatar(
          backgroundImage: NetworkImage(doctorImg),
        ),
        title: Text(doctorName),
        actions: <Widget>[
          IconButton(
            icon:const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8.0),
              children:  <Widget>[
                const ChatBubble(
                  isMe: true,
                  message: 'Hi doctor, how are you?',
                ),
                ChatBubble(
                  isMe: false,
                  message: "Hello, I'm $doctorName how can i help you",
                ),
              ],
            ),
          ),
          Container(
            decoration:  BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: MyColors().canvasColor,
                ),
              ),
            ),
            child: Row(
              children: <Widget>[
                IconButton(
                  icon:  Icon(Icons.photo,color: MyColors().blueColor),
                  onPressed: () {},
                ),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type a message',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(16.0),
                    ),
                  ),
                ),
                IconButton(
                  icon:  Icon(Icons.send,color: MyColors().blueColor),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final bool isMe;
  final String? message;

  const ChatBubble({super.key, required this.isMe, required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: isMe ? Colors.blueAccent : const Color(0xFF242424),
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16.0),
            topRight: const Radius.circular(16.0),
            bottomLeft: isMe ? const Radius.circular(16.0) : const Radius.circular(0.0),
            bottomRight: isMe ? const Radius.circular(0.0) : const Radius.circular(16.0),
          ),
        ),
        child: Text(
          message!,
          style:  const TextStyle(
            color: Colors.white ,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
