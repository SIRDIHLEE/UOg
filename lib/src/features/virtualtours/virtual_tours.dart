import 'package:flutter/material.dart';
import 'package:uog/src/constant/colors.dart';
import 'package:uog/src/features/virtualtours/widget/tour_item.dart';
import 'package:uog/src/features/virtualtours/widget/virtual_tour_item.dart';

class VirtualToursScreen extends StatelessWidget {
  const VirtualToursScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Virtual/ Audio tours",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: AppColors.primaryColor)),
        leading: const Icon(Icons.arrow_back),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                tourItem(
                  image: Image.asset("assets/images/tour1.png"),
                  text:
                      'Greenwich Campus sits on a UNESCO World Heritage Site on the banks of the River Thames.',
                  title: 'Greenwich Campus\nVirtual Tour',
                ),
                tourItem(
                  image: Image.asset("assets/images/tour2.png"),
                  text:
                      'Surrounded by green spaces, Avary Hill campus is located in Eltham, South-East London.',
                  title: 'Avery Hill Campus\nVirtual Tour',
                ),

                // Text("yh")
                // tourItem(title: "Avery Hill Campus\nVirtual Tour", text: "Surrounded by green spaces, Avary Hill campus is located in Eltham, South-East London.", image: Image.asset("assets/images/tour2.png"))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 12,12, 0),
            child: virtualTourItem(color: AppColors.scaffoldBackground, image: Image.asset("assets/images/tour3.png", height: 150,) , text: 'Take a look at our engineering and science labs, along with our student hub facilities across the historic setting in Chetham Maritime, Kent.', title: 'Medway Campus Virtual Tour',),
          ),
          // SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text("Audio tours",  style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20)),
          ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 0, 20,20),
          child: virtualTourItem(color: AppColors.greyColor, image: Image.asset("assets/images/tour4.png", height: 150,), text: "Take an audio tour of our of Greenwich campus. We’ll introduce you to the university  campus and the historic town centre", title: "Audio tours"),
        )
        ],
      ),
    );
  }
}

