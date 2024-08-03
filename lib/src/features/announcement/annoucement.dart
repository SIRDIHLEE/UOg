import 'package:flutter/material.dart';
import 'package:uog/src/constant/colors.dart';
import 'package:uog/src/features/announcement/widgets/annoucement_item.dart';

class AnnoucementScreen extends StatelessWidget {
  const AnnoucementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Annoucement",  style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.primaryColor)),
        centerTitle: true,
        leading:
            IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
      ),
      body: Container(
        color: Colors.grey.shade100,
        child: ListView(
          children: [
            annoucement_item(image: Image.asset('assets/images/frame1.png'), text: 'Event for prospective \nstudent:', subtitle: "From taster days to subject open evenings, find out more about what you'll study, where you'll study it and perhaps even meet who'll you'll be studying with."),
            const SizedBox(height: 15,),
            annoucement_item(image: Image.asset('assets/images/frame2.png'), text: "Teachers & Advisers", subtitle: "Whether you are a teacher or parent, we offer a range of events designed to assist you in helping others make life choice"),
              const SizedBox(height: 15,),
              annoucement_item(image: Image.asset("assets/images/frame3.png"), text: "Public event & Lectures", subtitle: "Learn something new or join the discussion at one of our many public lectures, seminars and events. Our public events cover everything from business and education to foreign policy and current affairs.")
          ],
        ),
      ),
    );
  }
}
