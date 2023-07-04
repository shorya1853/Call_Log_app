class CallLogModel {
  String name;
  String phoneNumber;
  int callCount;
  List<CallDetailsModel> callDetails;

  CallLogModel({
    required this.name,
    required this.phoneNumber,
    required this.callCount,
    required this.callDetails,
  });
}

class CallDetailsModel {
  String callType;
  DateTime callDate;
  int callDuration;
  String description;
  

  CallDetailsModel({
    required this.callType,
    required this.callDate,
    required this.callDuration,
    required this.description,
  });
}
