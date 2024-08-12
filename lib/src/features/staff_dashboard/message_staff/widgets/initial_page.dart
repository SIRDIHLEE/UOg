import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uog/src/constant/colors.dart';

import 'new_message_sheet.dart';

class InitialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBackground,
        title: Text(
          "Messages",
          style: GoogleFonts.poppins(),
        ),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
              padding: EdgeInsets.all(10.0),
              child: IconButton(
                onPressed: () {
                  _showNewMessageSheet(context);
                },
                icon: const Icon(Icons.mail),
              ))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Start Conversation',
              style: GoogleFonts.poppins(
                  fontSize: 24, fontWeight: FontWeight.bold),
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
                // backgroundColor: WidgetStateProperty.all<Color>(const Color(0xFF132238)),
                backgroundColor:
                    MaterialStateProperty.all<Color>(const Color(0xFF132238)),
              ),
              child: Text(
                'New Message',
                style: GoogleFonts.poppins(color: Colors.white),
              ),
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
