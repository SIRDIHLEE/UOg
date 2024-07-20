import 'package:flutter/material.dart';
import 'package:uog/src/constant/colors.dart';

class JobsScreen extends StatelessWidget {
  const JobsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jobs and Career",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: AppColors.primaryColor)),
        leading: const Icon(Icons.arrow_back),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset("assets/images/jobs.png"),
              ),
              const Positioned(
                  top: 210,
                  left: 18,
                  child: Text(
                    "Welcome from Professor Jane\nHarrington, the Vice-Chancellor",
                    style: TextStyle(color: AppColors.textColor, fontSize: 18),
                  ))
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              children: [
                Text(
                    "Welcome to the University of Greenwich. We are an ambitious and diverse community who take great pride in our institution’s 130-year history within the higher education sector. Our staff and students come from many walks of life and we value the talents and lived experience of each and every one of them. We believe in education without boundaries, supporting our students to achieve their ambitions because of, not despite, their background."),
                    SizedBox(height: 20,),
                Text(
                    "We are a positive force for change, leading the way in student experience, impact-driven research and knowledge exchange. Our impressive reputation for teaching and learning earned us a Silver rating in the 2017 Teaching Excellence Framework and we offer students an extensive portfolio of academic programmes. With the help of our highly talented and motivated staff, we are building on these firm foundations and our goal is to become the best modern university in the UK. \nAs well as offering a first-class learning experience for our students, we provide applied research and enterprise that is recognised nationally and internationally. Our research is regularly acknowledged as among the best in the world, with particular strengths in natural resources, pharmaceutical science and computational modelling."),
                    SizedBox(height: 20,),
                    Text("Our three beautiful campuses in London and Kent foster a sense of community to build networks, relationships and connections that set our students up for life. All our campuses are founded upon our commitment to create successful partnerships, providing sector-leading facilities and attracting talent from all over the world.")

              ],
            ),
          )
        ],
      ),
    );
  }
}
