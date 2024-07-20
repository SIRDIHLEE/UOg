import 'package:flutter/material.dart';
import 'package:uog/src/constant/colors.dart';

class tourItem extends StatelessWidget {
  const tourItem({
    super.key,
    required this.title,
    required this.text,
    required this.image,
  });
  final String title, text;
  final Image image;
  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            height: 120,
            // width: MediaQuery.of(context).size.width * 0.8,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
              topRight: Radius.circular(25),
              topLeft: Radius.circular(15),
            )),
            child: Stack(children: [
              image,
              // Image.asset("assets/images/tour1.png"),
              Positioned(
                  top: 70,
                  left: 10,
                  child: Text(
                    title,
                    style: TextStyle(color: AppColors.textColor),
                  )),
            ])),
        Container(
          decoration: const BoxDecoration(
            color: AppColors.greyColor,
          ),
          height: 145,
          width: MediaQuery.of(context).size.width * 0.43,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  text,
                  style: TextStyle(fontSize: 12),
                ),
                const SizedBox(
                  height: 10,
                ),
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
                      )),
                )
              ],
            ),
          ),
        ),
       

      ],
    );
  }
}
