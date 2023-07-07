import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> insertData(String description, String callDate, String calltype) async {
  const url = 'http://10.0.2.2:5000/insert';

  Map<String, dynamic> data = {
    'description': description,
    'call_date': callDate,
    'call_type': calltype,
  };

  final response = await http.post(
    Uri.parse(url),
    headers: {'Content-Type': 'application/json'},
    body: json.encode(data),
  );

  if (response.statusCode == 200) {
    print('Data inserted successfully');
  } else {
    print('Failed to insert data');
  }
}