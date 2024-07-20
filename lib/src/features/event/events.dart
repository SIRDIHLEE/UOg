import 'package:flutter/material.dart';
import 'package:uog/src/constant/colors.dart';
import 'package:uog/src/features/event/widgets/eventItem.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Events", style: TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.bold,),),
        centerTitle: true,
        leading: Icon(Icons.arrow_back),
      ),
      body: ListView(
        children: [
          EventItem(heading: "Open Day", date: "25th October 2024", subtext: "Join us for our open day to explore the campus and meet the faculty.", image: Image.asset("assets/images/cal.png", height: 20,), time: '10:00 AM - 3:00 PM', image2: Image.asset("assets/images/clock.png", height: 20,),),
          const SizedBox(height: 10,),
          EventItem(heading: "Virtual Tours", date: "25th October 2023", subtext: "Experience our campus from the comfort of your home with our virtual tour", image:  Image.asset("assets/images/cal.png", height: 20,), time: "10:00 AM - 3:00 PM", image2: Image.asset("assets/images/clock.png", height: 20,),),
          const SizedBox(height: 10,),
          EventItem(heading: "Meet the students", date: "25th October 2023", subtext: "Chat with our students and get a firsthand account of student life.", image: Image.asset("assets/images/cal.png", height: 20,), time: "10:00 AM - 3:00 PM", image2: Image.asset("assets/images/clock.png", height: 20,),),
          const SizedBox(height: 10,),
          EventItem(heading: "Course Information Session", date: "25th October 2023", subtext: "Learn more about our courses and the application process", image: Image.asset("assets/images/cal.png", height: 20,), time: "10:00 AM - 3:00 PM", image2: Image.asset("assets/images/clock.png", height: 20,),),
          const SizedBox(height: 10,),
          EventItem(heading: "Freshers' Week", date: "25th October 2023", subtext: "Join us for a week of fun activities and meet new friends!", image:  Image.asset("assets/images/cal.png", height: 20,), time: "10:00 AM - 3:00 PM", image2:  Image.asset("assets/images/clock.png", height: 20,),)

        ],
      ),
    );
  }
}
