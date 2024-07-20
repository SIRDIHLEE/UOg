import 'package:flutter/material.dart';
import 'package:uog/src/constant/colors.dart';
// import 'package:uog/src/features/busservice/widget/busservice_title_area.dart';

class BusserviceItem extends StatelessWidget {
  const BusserviceItem({super.key,   required this.leading, required this.trailing, required this.subtitle});
final String   leading, trailing, subtitle;
// final String title_
  @override
  Widget build(BuildContext context) {
    return  Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              
            
                 Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(subtitle, style: TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.bold, fontSize: 18),),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(leading, style: TextStyle(color: Colors.grey.shade600, fontWeight: FontWeight.bold, fontSize: 12),),
                     Text(trailing, style: TextStyle(color: Colors.grey.shade600, fontWeight: FontWeight.bold, fontSize: 12)),
                  ],
                ),
              ],
            );
  }
}