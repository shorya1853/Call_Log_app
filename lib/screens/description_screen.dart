import 'package:flutter/material.dart';

class DescriptionScreen extends StatelessWidget {
  DescriptionScreen({super.key});
  final TextEditingController descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Description'),
          actions: [
            IconButton(
              icon: const Icon(Icons.record_voice_over),
              onPressed: () {},
            )
          ],
        ),
        body: Column(
          children: [
            Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: descController,
            keyboardType: TextInputType.multiline,
            cursorHeight: 27,
          ),
        ),
        ElevatedButton(onPressed: (){}, child: const Text('Save'))
        ]),
        );
  }
}
