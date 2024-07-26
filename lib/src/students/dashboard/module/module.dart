import 'package:flutter/material.dart';
import 'package:uog/src/constant/colors.dart';
import 'package:uog/src/students/dashboard/module/module_Item.dart';

class ModuleOverviewScreen extends StatelessWidget {
  const ModuleOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.fromLTRB(2, 0, 0, 0),
          child: Text(
            "Hi, Joe Mike",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.primaryColor),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: Row(
              children: [
                Image.asset(
                  "assets/images/noti.png",
                  height: 25,
                ),
                Image.asset(
                  "assets/images/stuimg.png",
                  height: 40,
                )
              ],
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Text(
              "Module Overview",
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            ModuleItem(
                title: "COMP-1252-MO3-2023-24",
                text:
                    "School of Computing & Mathematical Sciences\n 2023-24(Greenwich Maritime Campus)",
                course: "Course: project"),
            SizedBox(
              height: 10,
            ),
            ModuleItem(
                title: "COMP-1430-MO1-2023-24",
                text:
                    "School of Computing & Mathematical Sciences\n 2023-24(Greenwich Maritime Campus)",
                course: "Course: System Design amd Development"),
                 SizedBox(
              height: 10,
            ),
            ModuleItem(
                title: "COMP-1430-MO1-2023-24",
                text:
                    "School of Computing & Mathematical Sciences\n 2023-24(Greenwich Maritime Campus)",
                course: "Course: Mobile Application Development"),
                 SizedBox(
              height: 10,
            ),
            ModuleItem(
                title: "COMP-1436-MO3-2023-24",
                text:
                    "School of Computing & Mathematical Sciences\n 2023-24(Greenwich Maritime Campus)",
                course: "Course: User Experience Design"),
          ],
        ),
      ),
    );
  }
}
