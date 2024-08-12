import 'package:flutter/material.dart';
import 'package:uog/src/students/dashboard/messages/widgets/student_new_message_screen.dart';

class StudentInitialChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Messages"),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                onPressed: () {
                  _showNewMessageSheet(context);
                },
                icon: const Icon(Icons.mail),
              ))
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
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
                style: TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _showNewMessageSheet(context);
                },
                style: ButtonStyle(
                  // backgroundColor: WidgetStateProperty.all<Color>(const Color(0xFF132238)),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(const Color(0xFF132238)),
                ),
                child: const Text(
                  'New Message',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showNewMessageSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => StudentNewMessageSheet(),
    );
  }
}
