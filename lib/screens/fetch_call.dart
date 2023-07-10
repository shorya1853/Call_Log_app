import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:queryapp/model/call_log_model.dart';

class FetchCall extends StatelessWidget {
  const FetchCall({super.key, required this.callLogs});

  final List<CallLogModel> callLogs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetched Data')
      ),
      body: ListView.builder(
        itemCount: callLogs.length,
        itemBuilder: (context, index){
          final List<CallDetailsModel> callDetail = callLogs[index].callDetails;
          return ListTile(
            title: Text(callLogs[index].phoneNumber),
            subtitle: Text(callLogs[index].name)
          );
      },),);
  }
}