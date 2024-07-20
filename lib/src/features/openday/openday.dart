import 'package:flutter/material.dart';
import 'package:uog/src/constant/colors.dart';
import 'package:uog/src/features/openday/widget/opendaytext.dart';
import 'package:uog/src/features/openday/widget/opendaytextfield.dart';

class Openday extends StatefulWidget {
  const Openday({super.key});

  @override
  State<Openday> createState() => _OpendayState();
}

class _OpendayState extends State<Openday> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Open Days",  style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.primaryColor),),
        leading: const Icon(Icons.arrow_back),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Stack(children: [
            Container(
              child: Image.asset("assets/images/openday.png"),
            ),
            const Positioned(
              // top: -100,
              // bottom: 10,
              child: ListTile(
                leading: Text(
                  "Next Open Day",
                  style: TextStyle(color: AppColors.textColor, fontSize: 13),
                ),
                trailing: Text(
                  "Saturday 17th August",
                  style: TextStyle(color: AppColors.textColor, fontSize: 13),
                ),
              ),
            )
          ]),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "What to expect on an Open Day",
                  style: TextStyle(
                      color: AppColors.blackColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Open Days give you a great sense of what it’s like to join our student community. As well as exploring our historic campus, you’ll get to take part in exciting taster sessions. These give you an idea of the style of learning you can expect once your course begins",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Open Day schedules",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blackColor),
                ),
                const SizedBox(
                  height: 15,
                ),
                const OpenDayText(text: "Name"),
                OpenDayTextField(
                  labeltext: 'Enter your full name',
                  onChanged: (String value) {},
                ),
                const SizedBox(
                  height: 10,
                ),
                const OpenDayText(text: "Email Address"),
                OpenDayTextField(
                  labeltext: 'Enter your Email Address',
                  onChanged: (String value) {},
                ),
                const SizedBox(
                  height: 10,
                ),
                const OpenDayText(text: "Area of Study"),
                // Text("drop down"),
                OpenDayTextField(
                  labeltext: 'Enter your Email Address',
                  onChanged: (String value) {},
                ),
                const SizedBox(
                  height: 10,
                ),
                const OpenDayText(text: "Subject"),
                OpenDayTextField(
                  labeltext: 'Enter Subject ',
                  onChanged: (String value) {},
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  decoration: const BoxDecoration(
                      // borderRadius: BorderRadius.circular(8),
                      ),
                  child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                      ),
                      child: const Text(
                        "Submit",
                        style: TextStyle(color: AppColors.textColor),
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
