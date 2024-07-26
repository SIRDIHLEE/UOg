import 'package:flutter/material.dart';

class IdCardScreen extends StatelessWidget {
  const IdCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset("assets/images/head.png"),
            ),
            Positioned(
              top: 135,
              right: 130,
              child: Image.asset("assets/images/id.png", height: 150,)),
         
          ]
          ),
          Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset("assets/images/btm.png")
          ],
         )
        ],
      ),
    );
  }
}
