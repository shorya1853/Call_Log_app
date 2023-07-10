import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:queryapp/call_post.dart';
import 'package:queryapp/model/call_log_model.dart';

class CallInsert extends StatelessWidget {
  const CallInsert({super.key, required this.callLogData});
  final List<CallLogModel> callLogData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: TextButton(child: Text('save'), onPressed: (){
        insertData(callLogData);
      },))
    );
  }
}