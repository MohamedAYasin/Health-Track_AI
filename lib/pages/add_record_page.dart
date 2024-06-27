import 'package:flutter/material.dart';

class AddRecordPage extends StatelessWidget {
  const AddRecordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Records Page'),
      ),
      body: const Center(
        child: Text('Welcome to the Add Records Page'),
      ),
    );
  }
}
