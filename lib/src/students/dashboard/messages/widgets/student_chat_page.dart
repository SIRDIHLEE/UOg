import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uog/src/constant/colors.dart';
import 'package:uog/src/students/dashboard/dashboard.dart';
import 'package:uog/src/students/dashboard/messages/widgets/student_new_message_screen.dart';
import 'package:uog/src/students/dashboard/student-dashboard.dart';

class StudentChatPage extends StatefulWidget {
  final DocumentSnapshot user;
  final String chatroomId;

  StudentChatPage({required this.user, required this.chatroomId});

  @override
  _StudentChatPageState createState() => _StudentChatPageState();
}

class _StudentChatPageState extends State<StudentChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late String _currentUserEmail;

  @override
  void initState() {
    super.initState();
    _getCurrentUserEmail();
  }

  void _getCurrentUserEmail() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        _currentUserEmail = user.email ?? ''; // Ensure email is not null
      });
    } else {
      // Handle the case when there is no current user
      // For example, you could redirect the user to a login page or show an error
    }
  }

  void _sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      await _firestore.collection('messages').add({
        'chatroomId': widget.chatroomId,
        'sender': _currentUserEmail,
        'receiver': widget.user['email'],
        'message': _messageController.text,
        'timestamp': FieldValue.serverTimestamp(),
      });
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBackground,
        title: Text(widget.user['name'] ?? 'Unknown User',style: GoogleFonts.poppins(),),
        leading: GestureDetector(
          onTap: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> StudentNewMessageSheet()));
          },
          child: const Icon(Icons.chevron_left, size: 30,),),// Ensure user name exists
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _firestore.collection('messages')
                  .where('chatroomId', isEqualTo: widget.chatroomId)
                  .orderBy('timestamp')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                final messages = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    final isCurrentUser = message['sender'] == _currentUserEmail;
                    return ListTile(
                      title: Align(
                        alignment: isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: isCurrentUser ? Colors.blue : Colors.grey[300],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            message['message'],
                            style: GoogleFonts.poppins(color: isCurrentUser ? Colors.white : Colors.black),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(bottom: 20.h,left: 10.w),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration:  InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.r)
                      ),
                    ),
                    minLines: 1,
                    maxLines: null,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
