
import 'package:flutter/material.dart';
import 'package:uog/src/constant/colors.dart';

class WhatIsHappeningWidget extends StatelessWidget {
  const WhatIsHappeningWidget({
    super.key, required this.heading, required this.date, required this.subtext, required this.image,
  });
  final String heading, date, subtext;
  final Image image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        // padding: EdgeInsets.all(16),
        height: 240,
        width: 350,
        decoration: BoxDecoration(
          // color: AppColors.scaffoldBackground,
          color: AppColors.scaffoldBackground,
          borderRadius: BorderRadius.circular(16)
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                // height: 129,
              child: image,
              //  Image.asset("assets/images/happen1.png"),
              ),
              // ListTile(
                // leading: Text("Civil engineering", style: TextStyle(
                //   color: AppColors.scaffoldBackground,
                //   fontSize: 20,
                // ),
              //   ),
              //   trailing: ),
                
              // ),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    heading, style: TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 20,
                ),
                ),
                Text(date, style: TextStyle(
                 color: AppColors.blackColor,
                  fontSize: 15,
              ),
              )
              ],),
               Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                  subtext , style: TextStyle(
                    color: AppColors.blackColor,)
                                      ),
                ],
              )
              // Expanded(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     Text("Your opportunity to learn more directly from our lecturers.")
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}