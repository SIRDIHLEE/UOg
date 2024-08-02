import 'package:flutter/material.dart';
import 'package:uog/src/constant/colors.dart';

import 'package:uog/src/features/busservice/widget/busservice_item.dart';
import 'package:uog/src/features/busservice/widget/busservice_title_area.dart';

class Busservice extends StatelessWidget {
  const Busservice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Bus service",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: AppColors.primaryColor),
        ),
        leading: const Icon(Icons.arrow_back),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
              height: 200,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(5),
                      topLeft: Radius.circular(5),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Image.asset(
                "assets/images/unsplash.png",
                fit: BoxFit.cover,
              )),
          const SizedBox(
            height: 10,
          ),

          // const SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 4, 4, 16),
            child: Container(
              padding: const EdgeInsets.all(12),
              height: 320,
              decoration: const BoxDecoration(color: Colors.white),
              child: const Column(
                children: [
                  BusserviceTitleArea(
                    title_: 'Stop Name',
                    title__: 'GRE-AH',
                  ),
                  BusserviceItem(
                      leading: "Queen Anne Court",
                      trailing: "08:15 09:35 10:30 11:30",
                      subtitle: "Greenwich Campus"),
                  SizedBox(
                    height: 20,
                  ),
                  BusserviceItem(
                      leading: "(Stop D) ",
                      trailing: "08:35 09:50 10:50 11:50 ",
                      subtitle: "Eltham Station"),
                  SizedBox(
                    height: 20,
                  ),
                  BusserviceItem(
                      leading: "Marks & Spencer (Stop L)",
                      trailing: "08:40 09:52 10:52 11:50",
                      subtitle: "Eltham High Street"),
                  SizedBox(
                    height: 20,
                  ),
                  BusserviceItem(
                      leading: "Marks & Spencer (Stop L)",
                      trailing: "08:40 09:52 10:52 11:50",
                      subtitle: "Avery Hill")
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding: const EdgeInsets.all(24),
              height: 320,
              decoration: const BoxDecoration(color: Colors.white),
              child: const Column(
                children: [
                  BusserviceTitleArea(
                    title_: 'Stop Name',
                    title__: 'AH-GRE',
                  ),
                  BusserviceItem(
                      leading: " Southwood site",
                      trailing: "08:15 09:35 10:30 11:30",
                      subtitle: "Avery Hill"),
                  SizedBox(
                    height: 20,
                  ),
                  BusserviceItem(
                      leading: "(Stop R) ",
                      trailing: "08:35 09:50 10:50 11:50 ",
                      subtitle: "Falconwood Station"),
                  SizedBox(
                    height: 20,
                  ),
                  BusserviceItem(
                      leading: "Queen Anne Court",
                      trailing: "08:40 09:52 10:52 11:50",
                      subtitle: "Greenwich Campus"),
                  // SizedBox(height: 20,),
                  // BusserviceItem(leading: "Marks & Spencer (Stop L)", trailing: "08:40 09:52 10:52 11:50", subtitle: "Avery Hill")
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
