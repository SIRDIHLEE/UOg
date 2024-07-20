import 'package:flutter/material.dart';
import 'package:uog/src/constant/colors.dart';

class virtualTourItem extends StatelessWidget {
  const virtualTourItem({
    super.key, required this.color, required this.image, required this.text, required this.title,
  });

final Color color;
final Image image;
final String text, title;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
        
      ),
      height: 200,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
          image,
            SizedBox(width: 8,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    
                  ),
                  // SizedBox(width: 20,),
                  Text(text),
                  // Text("data"),
                   Container(
            width: MediaQuery.of(context).size.width * 0.4,
            decoration: const BoxDecoration(
                // borderRadius: BorderRadius.circular(8),
                ),
            child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.tour,
                  padding: const EdgeInsets.symmetric(
                      vertical: 0, horizontal: 0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text(
                  "Explore",
                  style: TextStyle(color: AppColors.textColor),
                ))),
                ],
              ),
                  
            ),
             
          ],
        ),
      ),
    );
  }
}
