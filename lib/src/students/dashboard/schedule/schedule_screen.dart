import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:uog/src/common/custom_button.dart';
import 'package:uog/src/common/custom_text.dart';
import 'package:uog/src/constant/colors.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  String _selectedDate = '10';
  String _selectedDay = 'Wed';
  String date = '';
  bool showToday = true;

  void fetchCurrentDate() {
    final now = DateTime.now();
    final formattedDate = DateFormat('EEEE, d MMMM').format(now);
    setState(() {
      date = formattedDate;
    });
  }

  final Map<String, List<Map<String, String>>> _scheduleData = {
    '10': [
      {
        'title': 'COMP 1833',
        'subject': 'Software Quality Management',
        'location': 'Stockwell Academic, Greenwich Lecture',
        'instructor': 'Rowen Wright',
      },
    ],
    '11': [
      {
        'title': 'COMP 1834',
        'subject': 'Advanced Databases',
        'location': 'Main Campus, Lecture Hall 1',
        'instructor': 'Jane Doe',
      },
    ],
    '8': [
      {
        'title': 'COMP 1834',
        'subject': 'Advanced Databases',
        'location': 'Main Campus, Lecture Hall 1',
        'instructor': 'Jane Doe',
      },
    ],
  };

  List<Map<String, String>> get _scheduleForSelectedDate =>
      _scheduleData[_selectedDate] ?? [];

  void _onDateSelected(String date, String day) {
    setState(() {
      _selectedDate = date;
      _selectedDay = day;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Expanded(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: 18.0.w, top: 28.0.h, right: 18.0.w, bottom: 10.0.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CustomText(
                          inputText: _selectedDate,
                          fontSize: 50,
                          weight: FontWeight.w500,
                          color: Colors.black),
                      SizedBox(width: 2.0.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                              inputText: _selectedDay,
                              fontSize: 16,
                              weight: FontWeight.w500,
                              color: Colors.black.withOpacity(0.50)),
                          CustomText(
                              inputText: 'July 2024',
                              fontSize: 16,
                              weight: FontWeight.w500,
                              color: Colors.black.withOpacity(0.50)),
                        ],
                      ),
                      const Spacer(),
                      CustomButton(
                        onPressed: () {
                          // Logic for "Today" button
                        },
                        title: 'Today',
                        width: 72.0,
                        height: 35.0,
                      ),
                    ],
                  ),
                  SizedBox(height: 26.0.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DateTile(
                        title: 'Mon',
                        date: '8',
                        isSelected: _selectedDate == '8',
                        onTap: () => _onDateSelected('8', 'Mon'),
                      ),
                      DateTile(
                        title: 'Tue',
                        date: '9',
                        isSelected: _selectedDate == '9',
                        onTap: () => _onDateSelected('9', 'Tue'),
                      ),
                      DateTile(
                        title: 'Wed',
                        date: '10',
                        isSelected: _selectedDate == '10',
                        onTap: () => _onDateSelected('10', 'Wed'),
                      ),
                      DateTile(
                        title: 'Thu',
                        date: '11',
                        isSelected: _selectedDate == '11',
                        onTap: () => _onDateSelected('11', 'Thu'),
                      ),
                      DateTile(
                        title: 'Fri',
                        date: '12',
                        isSelected: _selectedDate == '12',
                        onTap: () => _onDateSelected('12', 'Fri'),
                      ),
                      DateTile(
                        title: 'Sat',
                        date: '13',
                        isSelected: _selectedDate == '13',
                        onTap: () => _onDateSelected('13', 'Sat'),
                      ),
                      DateTile(
                        title: 'Sun',
                        date: '14',
                        isSelected: _selectedDate == '14',
                        onTap: () => _onDateSelected('14', 'Sun'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            Container(
              height: 510.0.h,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 16.0.h),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CustomText(
                            inputText: 'Time',
                            fontSize: 15,
                            weight: FontWeight.w600,
                            color: Colors.white),
                        SizedBox(width: 26.0.w),
                        CustomText(
                            inputText: 'Schedule',
                            fontSize: 15,
                            weight: FontWeight.w600,
                            color: Colors.white),
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: _scheduleForSelectedDate.length,
                        itemBuilder: (context, index) {
                          final schedule = _scheduleForSelectedDate[index];
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  CustomText(
                                      inputText: '09:30',
                                      fontSize: 15,
                                      weight: FontWeight.w500,
                                      color: Colors.white ),
                                  SizedBox(height: 6.h,),
                                  CustomText(
                                      inputText: '12:00',
                                      fontSize: 15,
                                      weight: FontWeight.w500,
                                      color: Colors.white.withOpacity(0.50) ),
                                ],
                              ),
                              SizedBox(width: 11.w,),
                              Column(
                                children: [
                                  Container(height: 400.h,width: 2.w,color: Colors.white,)
                                ],
                              ),
                              SizedBox(width: 11.w,),
                              Container(
                                width: 270.w,
                                decoration: BoxDecoration(
                                  color: AppColors.scBColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding:  EdgeInsets.all(12.0.sp),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                          inputText: schedule['title']!,
                                          fontSize: 15,
                                          weight: FontWeight.w600,
                                          color: Colors.white),
                                      CustomText(
                                          inputText: schedule['subject']!,
                                          fontSize: 14,
                                          weight: FontWeight.w500,
                                          color: Colors.white),
                                      SizedBox(height: 24.0.h),
                                      Row(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Image.asset(
                                            'assets/images/pin-location-03.png',
                                            height: 20.0,
                                            width: 21.1,
                                            fit: BoxFit.scaleDown,
                                          ),
                                          SizedBox(width: 2.0.h),
                                          Expanded(
                                            child: CustomText(
                                                inputText:
                                                schedule['location']!,
                                                fontSize: 14,
                                                weight: FontWeight.w500,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 12.0.h),
                                      Row(
                                        children: [
                                          Container(
                                            height: 21.0.h,
                                            width: 21.0.w,
                                            decoration: const BoxDecoration(
                                                color: AppColors.greyColor,
                                                shape: BoxShape.circle),
                                          ),
                                          SizedBox(width: 4.0.w),
                                          CustomText(
                                              inputText: schedule['instructor']!,
                                              fontSize: 14,
                                              weight: FontWeight.w500,
                                              color: Colors.white),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class DateTile extends StatelessWidget {
  final String title;
  final String date;
  final bool isSelected;
  final VoidCallback onTap;

  const DateTile({
    super.key,
    required this.title,
    required this.date,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 68.h,
        width: 45.w,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.dateBColor : Colors.transparent,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding:  EdgeInsets.only(top: 5.0.h),
          child: Column(
            children: [
              CustomText(
                inputText: title,
                fontSize: 16,
                weight: FontWeight.w500,
                color: isSelected ? Colors.black.withOpacity(0.50) : Colors.black.withOpacity(0.50),
              ),
              CustomText(
                inputText: date,
                fontSize: 16,
                weight: FontWeight.w500,
                color: isSelected ? Colors.black : Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}