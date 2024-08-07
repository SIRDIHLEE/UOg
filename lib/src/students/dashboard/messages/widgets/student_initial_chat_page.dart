import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uog/src/constant/colors.dart';
import 'package:uog/src/students/dashboard/messages/widgets/student_new_message_screen.dart';


class StudentInitialChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBackground,
        title:  Text("Messages",style: GoogleFonts.poppins(),),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(onPressed: (){_showNewMessageSheet(context);}, icon: const Icon(Icons.mail),)
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text(
                'Start Conversation',
                style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
               Text(
                'You can view and reply to messages from here', style: GoogleFonts.poppins(fontSize: 12),
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
                child:  Text('New Message', style: GoogleFonts.poppins(color: Colors.white),),
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
