import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:queryapp/call_post.dart';
import 'package:queryapp/model/call_log_model.dart';
import 'package:queryapp/screens/callLog.dart';
import 'package:queryapp/screens/fetch_call.dart';


void main(){
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(context){
    return   MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<List<CallLogModel>>(
        future: getCallLogs(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            else if (snapshot.hasError) {
              if(snapshot.error.toString() == 'Connection failed'){
                return const CallLogScreen();
              }
              else{
                return Text('Error: ${snapshot.error}');
              }
            } else {
              final callLogs = snapshot.data!;
              return FetchCall(callLogs: callLogs);
            }
        })
      )
    );
  }
}
