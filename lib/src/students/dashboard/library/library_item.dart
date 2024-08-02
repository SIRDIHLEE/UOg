import 'package:flutter/material.dart';
import 'package:uog/src/constant/colors.dart';

class LibraryItem extends StatelessWidget {
  const LibraryItem(
      {super.key, required this.title, required this.time, required this.text});

  final String title, time, text;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 65,
      decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: AppColors.textColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text(text,
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontSize: 18,
                    ))
              ],
            ),
            Text(time,
                style: TextStyle(color: AppColors.textColor, fontSize: 15))
          ],
        ),
      ),
    );
  }
}
