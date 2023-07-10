import 'package:http/http.dart' as http;
import 'dart:convert';
import 'model/call_log_model.dart';



Future<String?> insertData(List<CallLogModel> callLogData) async {
  const url = 'http://10.0.2.2:5000/insert';

  final data = callLogData.map((e) => e.toJson(),).toList();


  final response = await http.post(
    Uri.parse(url),
    headers: {'Content-Type': 'application/json'},
    body: json.encode(data),
  );

  if (response.statusCode == 200) {

    print('Data inserted successfully');
    final responseData = jsonDecode(response.body);
    final insertID = responseData['inserted_id'];
    return insertID;
 
  } else {
    print('Failed to insert data');
  }
}

Future<List<CallLogModel>> getCallLogs() async {
  const url = 'http://10.0.2.2:5000/description';  

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body) ;
    final callData = jsonData.map((json) => CallLogModel.fromJson(json)).toList();
    return callData;
  } else {
    throw Exception('Failed to fetch call logs');
  }
}
