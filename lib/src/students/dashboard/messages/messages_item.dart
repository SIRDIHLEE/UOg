import 'package:flutter/material.dart';

class MessagesItem extends StatelessWidget {
  const MessagesItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset("assets/images/elip.png", height: 70 ),
        SizedBox(width: 10,),
        const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Rowen Wright", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),),
          Text("Please let me know what the\nproblem is exactly"),
          Text("2 hours ago"),
          
        ],
      ) ,
      ],
    );;
  }
}