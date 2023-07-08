import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:queryapp/call_post.dart';

class DescriptionScreen extends StatelessWidget {
  DescriptionScreen({super.key, required this.call_date, required this.calltype});
  final String call_date;
  final String calltype;
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
        ElevatedButton(onPressed: ()async{
          final id_response = await insertData(descController.text, call_date, calltype);
          print(id_response);
          
          Navigator.of(context).pop();
        }, child: const Text('Save'))
        ]),
        );
  }
}
