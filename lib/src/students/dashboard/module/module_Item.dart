import 'package:flutter/material.dart';
import 'package:uog/src/constant/colors.dart';

class ModuleItem extends StatelessWidget {
  const ModuleItem({super.key, required this.title, required this.text, required this.course});
final String title,text , course;
  @override
  Widget build(BuildContext context) {
    return Container(
              decoration: BoxDecoration(color: AppColors.primaryColor, borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 20, 8, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text(title, style: TextStyle(color: AppColors.textColor, fontSize: 20),),
                  SizedBox(height: 2,),
                  Text(text, style: TextStyle(color: AppColors.textColor),),
                 SizedBox(height: 10,),
                  Text(course, style: TextStyle(color: AppColors.textColor),)
                  
                ],),
              )
            );
  }
}