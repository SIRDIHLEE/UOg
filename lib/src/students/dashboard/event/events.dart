import 'package:flutter/material.dart';
import 'package:uog/src/constant/colors.dart';

class StudentEventScreen extends StatelessWidget {
  const StudentEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text("Events",  style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.primaryColor),),
      ),
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(

            ),
            child: Image.asset("assets/images/eventrec.png"),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("assets/images/event-1.png", height: MediaQuery.of(context).size.width * 0.7,),
                      Text("Midwifery 2021\nCohort Celebration", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                      Text("July 19th 2024")
                    ],
                  ),
                  // SizedBox(width: 30,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("assets/images/event-2.png", height:  MediaQuery.of(context).size.width * 0.7,),
                      Text("Islamic\nFriday prayer", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                      Text("July 19th 2024")
                    ],
                  ),
                  
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                     Image.asset("assets/images/event-1.png", height: MediaQuery.of(context).size.width * 0.7,),
                      Image.asset("assets/images/event-1.png", height: MediaQuery.of(context).size.width * 0.7,),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}