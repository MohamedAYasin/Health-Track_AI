import 'package:flutter/material.dart';

class RecordsPage extends StatelessWidget {
  const RecordsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reccords Page'),
      ),
      body: const Center(
        child: Text('Welcome to the Records Page'),
      ),
    );
  }
}
