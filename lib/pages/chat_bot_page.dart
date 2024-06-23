import 'package:flutter/material.dart';
import 'package:health_track_ai/constant/colors.dart';
import 'package:health_track_ai/models/message_model.dart';
import 'package:health_track_ai/widgets/chat_bubble.dart';
import 'package:health_track_ai/widgets/message_bar.dart';

final List<Message> dummyMessages = List.generate(
  10,
  (index) => Message(
    message: 'Message $index Hello World! This is a dummy message.',
    isSender: index % 2 == 0,
  ),
);

class ChatBotPage extends StatefulWidget {
  const ChatBotPage({super.key});

  @override
  State<ChatBotPage> createState() => _ChatBotPageState();
}

class _ChatBotPageState extends State<ChatBotPage> {
  final List<Message> messages = List.from(dummyMessages);
  final ScrollController _scrollController = ScrollController();

  void _handleSend(String message) {
    setState(() {
      messages.add(Message(
        message: message,
        isSender: true,
      ));
    });
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
