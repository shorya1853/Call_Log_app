import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:queryapp/model/call_log_model.dart';
import 'package:http/http.dart' as http;
import 'description_screen.dart';

class CallDetailScreen extends StatefulWidget {
  const CallDetailScreen({super.key, required this.calldetails});

  final List<CallDetailsModel> calldetails;

  @override
  State<CallDetailScreen> createState() => _CallDetailScreenState();
}

class _CallDetailScreenState extends State<CallDetailScreen> {

  void showingdialogBox(CallDetailsModel call_data) async {
    return showDialog(
      context: context,
      builder: ((context) {
        return AlertDialog(
            content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              child: const Text('Add Description'),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => DescriptionScreen(call_date: call_data.callDate, calltype: call_data.callType,)));
              },
            ),
            TextButton(onPressed: () {}, child: const Text('Recode Audio'))
          ],
        ));
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Call Detail'),
        ),
        body: ListView.builder(
          itemCount: widget.calldetails.length,
          itemBuilder: (context, index) {
            return ListTile(
                title: Text(widget.calldetails[index].callType),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  
                  children: [
                    Text(widget.calldetails[index].callDate.toString()),
                    Text(widget.calldetails[index].description)
                  ],
                ),
                trailing: IconButton(
                    icon: const Icon(Icons.more_vert),
                    onPressed: () {
                      showingdialogBox(widget.calldetails[index]);
                    }));
          },
        ));
  }
}
