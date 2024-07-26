import 'package:flutter/material.dart';
import 'package:uog/src/constant/colors.dart';

class NomessageScreen extends StatelessWidget {
  const NomessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(6),
          child: Text(
           "Messages",  style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.primaryColor),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image.asset("assets/images/mail.png"),
          )
        ],
          
      ),
      body: Center(
        
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Start Conversation", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            Text("You can view and reply to message from here", style: TextStyle( fontSize: 13),),
            Container(
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text("New Message", style: TextStyle(color: AppColors.textColor),),
              ),
            ), 
          ],
        ),
      ),
    );
  }
}