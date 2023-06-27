import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:queryapp/model/call_log_model.dart';

class CallDetailScreen extends StatefulWidget {
  const CallDetailScreen({super.key, required this.calldetails});

  final List<CallDetailsModel> calldetails;

  @override
  State<CallDetailScreen> createState() => _CallDetailScreenState();
}

class _CallDetailScreenState extends State<CallDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Call Detail'),
      ),
      body: ListView.builder(
        itemCount: widget.calldetails.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(widget.calldetails[index].callType)
          );
      },)
    );
  }
}