import 'package:flutter/material.dart';
import 'package:uog/src/constant/colors.dart';

class BusserviceTitleArea extends StatelessWidget {
  const BusserviceTitleArea({super.key, required this.title_, required this.title__});
final String title_, title__;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title_,
              style: const TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            Text(
              title__,
              style: const TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            )
          ],
        ),
         Divider(
          height: 2,
          color: AppColors.primaryColor,
        ),
         SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
