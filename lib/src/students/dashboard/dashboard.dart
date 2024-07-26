import 'package:flutter/material.dart';
import 'package:uog/src/constant/colors.dart';

class StudentDashboardScreen extends StatelessWidget {
  const StudentDashboardScreen({super.key});
// var int  cel = u2103;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.fromLTRB(2, 0, 0, 0),
          child: Text(
            "Hi, Joe Mike",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Row(
              children: [
                Text("Today"),
                SizedBox(
                  width: 15,
                ),
                Text("Modules")
              ],
            ),
            Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFFFFFFFF),
                    const Color(0xFF1D224E),
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(0.0, 1.0),
                ),
              ),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(8.0, 16, 0, 0),
                        child: Text(
                          "16\u2103",
                          style: TextStyle(
                            fontSize: 65,
                            color: AppColors.textColor,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(16.0, 0, 0, 0),
                        child: Text("United Kingdom\nLondon",
                            style: TextStyle(
                                color: AppColors.textColor, fontSize: 14)),
                      ),
                      //  Text("London", style: TextStyle(color: AppColors.textColor)),
                    ],
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 30, 8, 8),
                    child: Column(
                      children: [
                        Text(
                          "Monday, 03 July",
                          style: TextStyle(
                              color: AppColors.textColor, fontSize: 20),
                        ),
                        Expanded(
                            child: Text(
                          "⛅ Light rain|Remember \nto carry a light jacket",
                          style: TextStyle(color: AppColors.textColor),
                        ))
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Image.asset("assets/images/banner.png"),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                height: 350,
                decoration: BoxDecoration(
                    color: AppColors.scaffoldBackground,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Campus Service",
                      style: TextStyle(
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          // padding: EdgeInsets.only(left: 10),
                          children: [
                            Image.asset(
                              "assets/images/dash1.png",
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Image.asset("assets/images/dash2.png"),
                            SizedBox(
                              width: 8,
                            ),
                            Image.asset("assets/images/dash4.png"),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Social & Extracuricular",
                      style: TextStyle(
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Image.asset(
                            "assets/images/cam2.png",
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Image.asset(
                            "assets/images/cam1.png",
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Image.asset(
                            "assets/images/camp4.png",
                          ),
                        ],
                      ),
                    ))
                  ],
                )),
            const Text(
              "Nearest Eateries",
              style: TextStyle(
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),

            // SizedBox(
            //   height: 200,
            //   child: ListView(children: [
            //     Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: Container(
            //         // height: 160,
            //         decoration: BoxDecoration(
            //           color: AppColors.scaffoldBackground,
            //           borderRadius: BorderRadius.circular(10)
            //         ),
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Image.asset("assets/images/cam3.png", height: 150, ),
            //             Text("No. 92 Cafe",  style: TextStyle(
            //         color: AppColors.blackColor,
            //         // fontWeight: FontWeight.bold,
            //         // fontSize: 18
            //         )),
            //         Text("Breakfast & Brunch, Coffee & Tea",  style: TextStyle(
            //         color: AppColors.blackColor,
            //         // fontWeight: FontWeight.bold,
            //         // fontSize: 18
            //         )),

            //           ],
            //         ),
            //       ),
            //     )
            //   ],
            //   ),
            // ),
            Container(
              // height: 50,
              // height: ,
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                leading: Text(
                  "Leading Support",
                  style: TextStyle(color: AppColors.textColor, fontSize: 18),
                ),
                trailing: Icon(
                  Icons.arrow_forward,
                  color: AppColors.textColor,
                ),
              ),
            ),

            SizedBox(height: 10,),
             Container(
              // height: 50,
              // height: ,
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                leading: Text(
                  "View My Attendance",
                  style: TextStyle(color: AppColors.textColor, fontSize: 18),
                ),
                trailing: Icon(
                  Icons.arrow_forward,
                  color: AppColors.textColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
