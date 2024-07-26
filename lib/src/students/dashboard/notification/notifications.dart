import 'package:flutter/material.dart';
import 'package:uog/src/constant/colors.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(6),
          child: Text(
           "Notification",  style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.primaryColor),
          ),
          
        ),
       
          leading: Icon(Icons.arrow_back),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Text("Today's Update", style: TextStyle(color: AppColors.blackColor, fontSize: 18, fontWeight: FontWeight.bold),),
            Divider(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("assets/images/noti.png", height: 30,),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("Weather Alert:",  style: TextStyle(color: AppColors.red, fontSize: 18)),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Text("Stay prepared: Today's weather forecast includes\npartly cloudy skies with a high of 24°C and a low of\n16°C. Remember to carry a light jacket.", style: TextStyle(fontSize: 15),),
                    SizedBox(height: 10,),
                    Text("Few min ago", style: TextStyle(fontWeight: FontWeight.bold),)
                  ],
                ),
               
              ],
            ),
             Divider()
          ],
        ),
      ),
    );
  }
}