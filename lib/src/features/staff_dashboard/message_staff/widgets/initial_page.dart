import 'package:flutter/material.dart';

import 'new_message_sheet.dart';

class InitialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Messages"),
        automaticallyImplyLeading: false,
        actions:[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: IconButton(onPressed: (){_showNewMessageSheet(context);}, icon: const Icon(Icons.mail),)
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Start Conversation',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'You can view and reply to messages from here',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _showNewMessageSheet(context);
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(const Color(0xFF132238)),
              ),
              child: const Text('New Message', style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }

  void _showNewMessageSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => NewMessageSheet(),
    );
  }
}
