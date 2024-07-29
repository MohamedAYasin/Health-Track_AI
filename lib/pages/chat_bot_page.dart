import 'package:flutter/material.dart';
import 'package:health_track_ai/constant/colors.dart';
import 'package:health_track_ai/models/message_model.dart';
import 'package:health_track_ai/widgets/chat_bubble.dart';
import 'package:health_track_ai/widgets/message_bar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatBotPage extends StatefulWidget {
  const ChatBotPage({super.key});

  @override
  State<ChatBotPage> createState() => _ChatBotPageState();
}

class _ChatBotPageState extends State<ChatBotPage> {
  final List<Message> messages = List.from([]);
  final ScrollController _scrollController = ScrollController();

  void _handleSend(String message) async {
    setState(() {
      messages.add(Message(
        message: message,
        isSender: true,
      ));
    });

    // Send the message to the FastAPI server
    final response = await http.post(
      Uri.parse('https://chat-bot-model.onrender.com/chat'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({'message': message}),
    );

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      final botMessage = responseBody['response'];

      setState(() {
        messages.add(Message(
          message: botMessage,
          isSender: false,
        ));
      });

      // Scroll to the bottom of the list
      _scrollController.animateTo(
        _scrollController.position.minScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    } else {
      setState(() {
        messages.add(Message(
          message: "Error: Could not get response from server.",
          isSender: false,
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Bot',
            style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: CustomColors.mainBlue,
        foregroundColor: CustomColors.white,
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: messages.length,
        reverse: true, // Reverses the list order
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: ChatBubble(
              message: messages[messages.length - 1 - index].message,
              isSender: messages[messages.length - 1 - index].isSender,
            ),
          );
        },
      ),
      bottomNavigationBar: MessageBar(onSend: _handleSend),
    );
  }
}
