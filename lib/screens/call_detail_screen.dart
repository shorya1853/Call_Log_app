import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:queryapp/model/call_log_model.dart';

import 'description_screen.dart';

class CallDetailScreen extends StatefulWidget {
  const CallDetailScreen({super.key, required this.calldetails});

  final List<CallDetailsModel> calldetails;

  @override
  State<CallDetailScreen> createState() => _CallDetailScreenState();
}

class _CallDetailScreenState extends State<CallDetailScreen> {
  void showingdialogBox() async {
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
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => DescriptionScreen()));
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
                subtitle: Text(widget.calldetails[index].callDate.toString()),
                trailing: IconButton(
                    icon: const Icon(Icons.more_vert),
                    onPressed: () {
                      showingdialogBox();
                    }));
          },
        ));
  }
}
