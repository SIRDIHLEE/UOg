
import 'package:flutter/material.dart';
import 'package:uog/src/constant/colors.dart';

class EventItem extends StatelessWidget {
  const EventItem({
    super.key, required this.heading, required this.date, required this.subtext, required this.image, required this.time, required this.image2,
  });
 final String heading, date, subtext, time;
  final Image image, image2;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          color: AppColors.greyColor,
          borderRadius: BorderRadius.circular(12)
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(heading,style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
            color: AppColors.blackColor
          ),),
            Text(subtext, style: TextStyle(
            fontSize: 18,
            // fontWeight: FontWeight.bold,
            color: AppColors.openday
          ),),
          SizedBox(height: 13,),
            Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
            Row(
              children: [
              // Image.asset(image, height: 20,),
              image ,
              SizedBox(width: 3,),
              Text(date,  style: TextStyle(
            // fontSize: 18,
            // fontWeight: FontWeight.bold,
            color: AppColors.openday
          ),)
            ],
            ),
              Row(
              children: [
              // Image.asset("assets/images/clock.png", height: 20,),
              image2,
              SizedBox(width: 3,),
              Text(time,  style: TextStyle(
            // fontSize: 18,
            // fontWeight: FontWeight.bold,
            color: AppColors.openday
          ),)
            ],
            ),
            ],)
          ],
          
          
          ),
        ),
      ),
    );
  }
}