import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uog/src/constant/colors.dart';
import 'chat_page.dart';

class NewMessageSheet extends StatefulWidget {
  @override
  _NewMessageSheetState createState() => _NewMessageSheetState();
}

class _NewMessageSheetState extends State<NewMessageSheet> {
  String _searchTerm = '';
  String? _currentUserEmail;

  @override
  void initState() {
    super.initState();
    _getCurrentUserEmail();
  }

  void _getCurrentUserEmail() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        _currentUserEmail = user.email;
      });
    }
  }

  Future<void> _createChatroomIfNotExists(String userId) async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      final currentUserId = currentUser.uid;

      final chatroomId = _generateChatroomId(currentUserId, userId);

      final chatroomDoc = FirebaseFirestore.instance.collection('chatrooms').doc(chatroomId);
      final chatroomSnapshot = await chatroomDoc.get();

      if (!chatroomSnapshot.exists) {
        await chatroomDoc.set({
          'participants': [currentUserId, userId],
          'lastUpdated': FieldValue.serverTimestamp(),
        });
      }
    }
  }

  String _generateChatroomId(String user1, String user2) {
    return user1.compareTo(user2) < 0 ? '$user1-$user2' : '$user2-$user1';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBackground,
        title: Text('Messages', style:  GoogleFonts.poppins(),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search users...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _searchTerm = value;
                  });
                },
              ),
            ),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .where('email', isNotEqualTo: _currentUserEmail ?? '') // Exclude current user
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                final users = snapshot.data!.docs;
                final filteredUsers = users.where((user) {
                  final userName = user['name'].toString().toLowerCase();
                  return userName.contains(_searchTerm.toLowerCase());
                }).toList();

                return Column(
                  children: filteredUsers.map((user) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/unsplash.png'), // Hardcoded profile picture
                      ),
                      title: Text(user['name']),
                      onTap: () async {
                        // Create chatroom if it doesn't exist
                        await _createChatroomIfNotExists(user.id);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChatPage(
                              chatroomId: _generateChatroomId(FirebaseAuth.instance.currentUser!.uid, user.id),
                              user: user,
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
