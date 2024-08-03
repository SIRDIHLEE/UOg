import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uog/src/students/dashboard/student_attendance/widgets/attendance_item.dart';

import '../../../common/custom_text.dart';

class StudentAttendance extends StatelessWidget {
  const StudentAttendance({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: const Color(0xFF424D5C)),
                    width: 340.w,
                    height: 280.h,
                    child: Image.asset(
                      "assets/images/attendance_pic.PNG",
                      width: 330.w,
                      height: 276.h,
                    )),
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomText(
                inputText: 'Courses',
                fontSize: 18,
                weight: FontWeight.w600,
                color: Colors.black,
              ),
              SizedBox(
                height: 20.h,
              ),
              const AttendanceItem(
                  title: "COMP-1436",
                  subtitle: "Attendance rate",
                  percentage: "60%",
                  count: "2",
                  status: "Not Present"),
              SizedBox(
                height: 20.h,
              ),
              const AttendanceItem(
                  title: "COMP-1430",
                  subtitle: "Attendance rate",
                  percentage: "100%",
                  count: "0",
                  status: "Not Present"),
              SizedBox(
                height: 20.h,
              ),
              const AttendanceItem(
                  title: "COMP-1424",
                  subtitle: "Attendance rate",
                  percentage: "80%",
                  count: "2",
                  status: "Not Present"),
              SizedBox(
                height: 20.h,
              ),
              const AttendanceItem(
                  title: "COMP-1252",
                  subtitle: "Attendance rate",
                  percentage: "80%",
                  count: "2",
                  status: "Not Present"),
            ],
          ),
        ),
      ),
    );
  }
}
