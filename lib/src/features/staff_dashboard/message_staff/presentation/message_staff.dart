import 'package:flutter/material.dart';

import '../widgets/initial_page.dart';

class MessageStaff extends StatefulWidget {
  const MessageStaff({super.key});

  @override
  State<MessageStaff> createState() => _MessageStaffState();
}

class _MessageStaffState extends State<MessageStaff> {
  @override
  Widget build(BuildContext context) {
    return InitialPage();
  }
}
