import 'package:flutter/material.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:health_track_ai/constant/colors.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isSender;

  const ChatBubble({required this.message, required this.isSender, super.key});

  @override
  Widget build(BuildContext context) {
    return BubbleSpecialThree(
      text: message,
      color: isSender
          ? CustomColors.mainBlue
          : Colors.grey[300] ?? const Color.fromARGB(255, 104, 10, 10),
      tail: true,
      textStyle: TextStyle(
          color: isSender ? CustomColors.white : CustomColors.black,
          fontSize: 16),
      isSender: isSender,
    );
  }
}
