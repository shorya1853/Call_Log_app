import 'package:call_log/call_log.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/call_log_model.dart';

class CallcountNotifier extends StateNotifier<List<CallLogModel>>{
  CallcountNotifier(): super([]);


  List<CallLogModel> _processCallLogEntries(Iterable<CallLogEntry> entries) {
  Map<String, CallLogModel> callLogMap = {};

    for(var entry in entries){
    String phoneNumber = entry.number!;

    if (callLogMap.containsKey(phoneNumber)) {
      CallLogModel callLog = callLogMap[phoneNumber]!;
      callLog.name = entry.name ?? 'USER';
      callLog.callCount += 1;
      callLog.callDetails.add(CallDetailsModel(
        description: '',
        callType: entry.callType.toString(),
        callDate:  DateTime.fromMillisecondsSinceEpoch(entry.timestamp!),
        callDuration: entry.duration!,
      ));
    } else {
      callLogMap[phoneNumber] = CallLogModel(
        name: entry.name ?? 'USER',
        phoneNumber: phoneNumber,
        callCount: 1,
        callDetails: [
          CallDetailsModel(
            description: '',
            callType: entry.callType.toString(),
            callDate: DateTime.fromMillisecondsSinceEpoch(entry.timestamp!),
            callDuration: entry.duration!,
          ),
        ],
      );
    }
  }

  return callLogMap.values.toList();
}
}

final callLogProvider = StateNotifierProvider<CallcountNotifier, List<CallLogModel>>((ref)  {
  return CallcountNotifier();
});

final call_provider = FutureProvider((ref) async{
  final entries = await CallLog.get();
  final calldetail = ref.watch(callLogProvider.notifier)._processCallLogEntries(entries);
  return calldetail;
    
},);