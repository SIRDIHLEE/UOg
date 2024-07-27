import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:uog/src/constant/colors.dart';

class StudentDashboardScreen extends StatefulWidget {
  const StudentDashboardScreen({super.key});

  @override
  _StudentDashboardScreenState createState() => _StudentDashboardScreenState();
}

class _StudentDashboardScreenState extends State<StudentDashboardScreen> {
  String temperature = 'Loading...';
  String date = '';
  final String apiKey = 'c08be28fb67f0ecec65e2ecaeae3c72f';
  bool showToday = true;

  @override
  void initState() {
    super.initState();
    fetchWeatherData();
    fetchCurrentDate();
  }

  Future<void> fetchWeatherData() async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=London&units=metric&appid=$apiKey'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        temperature = '${data['main']['temp'].toStringAsFixed(0)}\u2103';
      });
    } else {
      setState(() {
        temperature = 'Error';
      });
    }
  }

  void fetchCurrentDate() {
    final now = DateTime.now();
    final formattedDate = DateFormat('EEEE, d MMMM').format(now);
    setState(() {
      date = formattedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.fromLTRB(2, 0, 0, 0),
          child: Text(
            "Hi, Joe Mike",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      showToday = true;
                    });
                  },
                  child: Text(
                    "Today",
                    style: TextStyle(
                      decoration: showToday ? TextDecoration.underline : TextDecoration.none,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      showToday = false;
                    });
                  },
                  child: Text(
                    "Modules",
                    style: TextStyle(
                      decoration: !showToday ? TextDecoration.underline : TextDecoration.none,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: showToday ? buildTodayContent() : buildModulesContent(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTodayContent() {
    return ListView(
      children: [
        Container(
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: [
                const Color(0xFF60B5D5),
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
                      temperature,
                      style: TextStyle(
                        fontSize: 45,
                        color: AppColors.textColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16.0, 0, 0, 0),
                    child: Text("United Kingdom\nLondon",
                        style: TextStyle(
                            color: AppColors.textColor,
                            fontSize: 12,
                            fontWeight: FontWeight.bold)),
                  ),
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
                      date,
                      style: TextStyle(
                          color: AppColors.textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                        child: Text(
                          "⛅ Light rain|Remember \nto carry a light jacket",
                          style:
                          TextStyle(color: AppColors.textColor, fontSize: 11),
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
        Container(
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
        SizedBox(
          height: 10,
        ),
        Container(
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
    );
  }

  Widget buildModulesContent() {
    return Center(
      child: Text(
        "Welcome to Modules",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
