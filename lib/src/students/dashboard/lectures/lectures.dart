import 'package:flutter/material.dart';
import 'package:uog/src/constant/colors.dart';

class LecturesScreen extends StatelessWidget {
  const LecturesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text("My Lecturers",  style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.primaryColor),),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Divider(),
          ListTile(
            leading: Image.asset("assets/images/elip.png"),
            title: Text("Rowen Wright", style: TextStyle(fontWeight: FontWeight.bold),),
            subtitle: Text("Online"),
            // trailing: ,

          ),
          Divider(),
        ],
      ),
    );
  }
}