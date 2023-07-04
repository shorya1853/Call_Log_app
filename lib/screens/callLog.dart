import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:queryapp/provider/call_provider.dart';
import 'package:queryapp/screens/call_detail_screen.dart';

import '../model/call_log_model.dart';

class CallLogScreen extends StatelessWidget {
  const CallLogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Call Log'),
      ),
      body: Consumer(
        builder: (context, ref, _) {
          AsyncValue<List<CallLogModel>> callLogData = ref.watch(call_provider);

          return callLogData.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stackTrace) => Text('Error: $error'),
            data: (callLogList) {
              return ListView.builder(
                itemCount: callLogList.length,
                itemBuilder: (context, index) {
                  CallLogModel callLog = callLogList[index];
                 
                  // Display the call log data here
                  return ListTile(
                      title: Text(callLog.name),
                      subtitle: Row(
                        children: [
                          Text(callLog.phoneNumber),
                          Container(
                            width: 15,
                            height: 15.0,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromRGBO(239, 234, 234, 1)),
                            child: Center(
                              child: Text(
                                callLog.callCount.toString(),
                                style: const TextStyle(
                                  fontSize: 10,
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Icon(callLog.callDetails[0].callType == 'CallType.outgoing' ? Icons.call_received : Icons.call_made),
                          )
                        ],
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CallDetailScreen(
                                calldetails: callLog.callDetails)));
                      },
                      trailing: const Icon(Icons.call));
                },
              );
            },
          );
        },
      ),
    );
  }
}
