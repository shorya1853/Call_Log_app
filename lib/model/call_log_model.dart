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

  factory CallLogModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> callfromjson = json['callDetails'];

    List<CallDetailsModel> callDetails =
        callfromjson.map((item) => CallDetailsModel.fromJson(item)).toList();

    return CallLogModel(
      name: json['name'],
      phoneNumber: json['phoneNumber'],
      callCount: json['callCount'],
      callDetails: callDetails,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phoneNumber': phoneNumber,
      'callCount': callCount,
      'callDetails': callDetails.map((detail) => detail.toJson()).toList(),
    };
  }
}

class CallDetailsModel {
  String callType;
  String callDate;
  int callDuration;
  String description;

  CallDetailsModel({
    required this.callType,
    required this.callDate,
    required this.callDuration,
    required this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'callType': callType,
      'callDate': callDate,
      'callDuration': callDuration,
    };
  }

  factory CallDetailsModel.fromJson(Map<String, dynamic> json) {
    return CallDetailsModel(
      description: json['description'],
      callType: json['callType'],
      callDate: json['callDate'],
      callDuration: json['callDuration'],
    );
  }
}
